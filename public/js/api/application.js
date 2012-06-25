function logout() {
    ajaxPost(logout_url, null,
        function() {
            window.location = successLogout_url;
        },
        function() {
            alert(FAIL_TO_CONNECT);
        }
    );
}

