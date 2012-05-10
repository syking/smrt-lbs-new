var bonfire = {};

var serve, request, isIE = false;
if (window.chrome) {
    /**
     * serve -- Create a server to handle requests.
     * @param {string} name
     * @param {function} server -- Called with data from the requester and a callback to communicate its response
     */
    serve = function(name, server) {
        chrome.extension.onRequest.addListener(function(message, _, callback) {
            if (message.name === name) {
                server(message.data, callback);
            }
        });
    };
    /**
     * request -- Send data to a named server and receive its response.
     * @param {string} name
     * @param data -- Any type that can be JSON-serialised
     * @param {function=} receiver -- Called with the return value of the corresponding server handler
     */
    request = function(name, data, receiver) {
        chrome.extension.sendRequest({
            name: name,
            data: data
        }, receiver);
    };
} else if (window.safari) {
    // NOTE: This implementation for Safari will only work from content scripts, not background scripts!
    serve = function(name, handler) {
        safari.self.addEventListener('message', function(event) {
            if (event.name === name) {
                var responseName = event.message.name;
                handler(event.message.data, function(result) {
                    if (responseName) {
                        safari.self.tab.dispatchMessage(responseName, result);
                    }
                });
            }
        }, false);
    };
    request = function(name, data, receiver) {
        var responseName = null;
        if (receiver) {
            responseName = Math.floor(1e16 * Math.random()).toString(16);
            safari.self.addEventListener('message', function handleMessage(event) {
                if (event.name === responseName) {
                    // Remove response listener so as not to leak memory.
                    safari.self.removeEventListener('message', handleMessage, false);
                    receiver(event.message);
                }
            }, false);
        }
        safari.self.tab.dispatchMessage(name, {
            name: responseName,
            data: data
        });
    };
} else {
    serve = request = function() {
        //console.warn('No messaging API available');
    };
}

var getData, putData;
(function() {
    var STORAGE;
    var PUT_DATA_LISTENERS = {};
    if (location.protocol === 'chrome:' && window.Components) {
        // localStorage is not available within Firefox extensions over chrome:// protocol.
        // Use the following workaround by Shawn Wilsher:
        // https://bugzilla.mozilla.org/show_bug.cgi?id=495747#c10
        STORAGE = (function(URI) {
            var ios = Components.classes["@mozilla.org/network/io-service;1"].getService(Components.interfaces.nsIIOService);
            var ssm = Components.classes["@mozilla.org/scriptsecuritymanager;1"].getService(Components.interfaces.nsIScriptSecurityManager);
            var dsm = Components.classes["@mozilla.org/dom/storagemanager;1"].getService(Components.interfaces.nsIDOMStorageManager);
            return dsm.getLocalStorageForPrincipal(ssm.getCodebasePrincipal(ios.newURI(URI, '', null)), '');
        })('http://excalibur.atlassian.com/');
		}
	else if (window.ActiveXObject){
		STORAGE = null;
	}	
	else {
        STORAGE = window.localStorage;
    }
    /**
     * getData -- Retrieve data from the local database.
     * @param {string} key
     * @returns {*} -- The value supplied to putData, otherwise null
     */
    getData = function(key) {
		if (STORAGE){
			return JSON.parse(STORAGE[key] || null);
		}
		else if (window.external){
			return JSON.parse(window.external.getValue(key) || null);
		}
    };
    /**
     * putData -- Store a value persistently in the local database.
     * @param {string} key
     * @param value -- Any type that can be serialised to JSON
     */
    putData = function(key, value) {
        var storageValue = JSON.stringify(value);
		if (STORAGE){
			try {
				STORAGE[key] = storageValue;
			} catch (error) {
				// error == QUOTA_EXCEEDED_ERR (probably)
				// @i18n
				alert("Bonfire can't store any more data! If possible, try increasing your web browser's local database storage limit, or else delete some unused Bonfire data.");
			}
		}
		else if (window.external){
			window.external.setValue(key,storageValue);
		}
        if (!putData.skipListeners) {
            var listeners = getListeners(key);
            var form = window.document && document.getElementById(key);
            for (var i = 0, ii = listeners.length; i < ii; i++) {
                listeners[i].call(form, value);
            }
            // Check for any global putData listeners
            listeners = getListeners('-=ALL=-');
            for (i = 0, ii = listeners.length; i < ii; i++) {
                listeners[i].call(form, key, value);
            }
        }
    };
    /**
     * putData.addListener -- Call the given callback function whenever putData is called with the given key.
     * @param {string} key
     * @param {function} callback -- A function called with new value supplied to putData
     */
    putData.addListener = function(key, callback) {
        getListeners(key).push(callback);
    };
    /**
     * putData.removeListener -- Remove the given callback function from the set of putData listeners.
     * @param {string} key
     * @param {function} callback -- The function to remove
     */
    putData.removeListener = function(key, callback) {
        var listeners = getListeners(key);
        for (var i = 0; i < listeners.length; i++) {
            if (listeners[i] === callback) {
                listeners.splice(i, 1);
            }
        }
    };
    function getListeners(key) {
        return PUT_DATA_LISTENERS[key] || (PUT_DATA_LISTENERS[key] = []);
    }
})();
