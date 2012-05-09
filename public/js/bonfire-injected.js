/*global window: true, serve: true, evalExpression: true, request: true, */

var issueData = null;
var userScrollCoords = null;

if (window === top) { // Don't initialise injected script inside frames.
    serve('ping', function (pingId, callback) {
        callback(pingId);
    });
    serve('issueData', function(_, callback) {
        callback(issueData);
        issueData = null; // This request was triggered by a shortcut; issueData should not persist.
    });
    serve('scrollTo', function(frameIndex, callback) {
        if (frameIndex === 0) {
            // Store current scroll position.
            userScrollCoords = {
                x: document.body.scrollLeft,
                y: document.body.scrollTop
            };
        }
        var W = document.width;
        var H = document.height;
        var w = document.body.clientWidth;
        var h = document.body.clientHeight;
        var n = Math.ceil(W / w);
        var x = w * (frameIndex % n);
        var y = h * (Math.floor(frameIndex / n));
        if (x < W && y < H) {
            x = Math.min(x, W - w);
            y = Math.min(y, H - h);
            window.scrollTo(x, y);
            // Wait for the browser to render new scroll position.
            setTimeout(function() {
                callback({
                    x: x,
                    y: y,
                    w: w,
                    h: h
                });
            }, 0);
        } else {
            // There is no frame at these coordinates.
            callback(null);
            // Restore original scroll position.
            window.scrollTo(userScrollCoords.x, userScrollCoords.y);
            userScrollCoords = null;
        }
    });
    serve('evalVariable', function(variable, callback) {
        callback({name:variable.name, value:evalExpression(variable.value)});
    });

    /**
     * Keyboard shortcuts
     */
    document.addEventListener('keydown', function (event) {
        var IGNORE_KEYS = {
             9: 'tab',
            16: 'shift',
            17: 'ctrl',
            18: 'alt'
        };
        if (!event.ctrlKey || !event.altKey || IGNORE_KEYS[event.keyCode]) {
            return;
        }
        request('shortcut', String.fromCharCode(event.keyCode), function () {});
    });
}

function evalExpression(source) {
    // TODO: eval from within the scope of the originating page, instead of the injected script's sandbox.
    try {
        return Function('return ' + source)();
    } catch (error) {
        return 'Error in variable "' + source + '" (' + error + ')';
    }
}
