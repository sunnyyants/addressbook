// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap


$(document).ready(function(){

    $('.lightbox').click(function(){
        $('.backdrop, .box').animate({'opacity':'.50'}, 300, 'linear');
        $('.box').animate({'opacity':'1.00'}, 300, 'linear');
        $('.backdrop, .box').css('display', 'block');
    });

    $('.close').click(function(){
        close_box();
    });

    $('.backdrop').click(function(){
        close_box();
    });

});

function close_box()
{
    $('.backdrop, .box').animate({'opacity':'0'}, 300, 'linear', function(){
        $('.backdrop, .box').css('display', 'none');
    });
}