
$(document).ready(function() {
    try {
        $('#slider').s3Slider({
            timeOut: 8000       // slider timeout setting
        });
    }
    catch (err){
        // No slider
    }

    //underline current button
    var current = $("#header_menu_" + chapter);
    current.addClass('current');

    // Popup login form
    var login_form = $("#sign_form");
    var black_background = $("#overlay_signup");
    var sign_in_button = $('#header_menu_sign_in');

    login_form.hide();
    black_background.hide();

    sign_in_button.click(function () {
        login_form.css('opacity', 1);
        login_form.css('right', '20px');
        login_form.fadeIn(500);
        login_form.show();
        black_background.show();
    });

    black_background.click(function () {
        login_form.animate({
            width: "160px",
            opacity: 0,
            top : "3px",
            right : "-50px"
        }, 500 );
        login_form.css('display', 'none');
        $(this).hide();
    });

    $(".post_likes").click(
        function() {
            var id = $(this).attr('id');
            var post_id = id.split('_for_', 2)[1];
            var likes = $(this).find('span').text();

            $.post(
                "/like_post",
                {
                    //beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
                    id: post_id
                },
                onAjaxSuccess
            );

            function onAjaxSuccess(data) {
                $('#' + id).find('span').text( (parseInt(likes) + 1).toString() );
            }
        }
    )
});