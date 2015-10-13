// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(function () {
    $('.js-add_credit_card').on('click', function () {
        event.preventDefault();
        var form = $('.js-credit_card_form').clone().removeClass('js-credit_card_form');
        var unique_id = Date.now();

        $('label', form).each(function (index) {
            var for_text = $(this).attr('for');
            $(this).attr('for', for_text.replace('0', unique_id));
        });

        $('input', form).each(function (index) {
            var id_text = $(this).attr('id');
            var name_text = $(this).attr('name');
            $(this).attr('id', id_text.replace('0', unique_id));
            $(this).attr('name', name_text.replace('0', unique_id));
        });

        $('.js-credit_card_form').after(form);
    });
});