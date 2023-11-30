/**
 * Game landing js
 *
 */
$(document).ready(function () {

    $('#gameForm').submit(function () {
        if ($('#privacyConsent:checked').length == 0) {
            alert('Please agree to our privacy policy');
            return false;
        }
    });
});
