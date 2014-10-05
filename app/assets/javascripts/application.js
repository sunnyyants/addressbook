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
//= require best_in_place
//= require best_in_place.purr
//= require turbolinks
//= require_tree .
//= require bootstrap


$(document).ready(function(){


    $('#searchNow').click(function(){
        $('.backdrop, #searchBox').animate({'opacity':'.50'}, 300, 'linear');
        $('#searchBox').animate({'opacity':'1.00'}, 300, 'linear');
        $('.backdrop,  #searchBox').css('display', 'block');
    });

    $('.close').click(function(){
        close_box();
    });

    $('.backdrop').click(function(){
        close_box();
    });

    // pagination javascript

    $('#friends').on('click','.flickr_pagination a',function(){
        $.get(this.href, null, null, "script");
        return false;
    });

    $('#results').on('click','.flickr_pagination a',function(){
        $.get(this.href, null, null, "script");
        return false;
    });

    // search ajax request
    $('#searchForm').on('submit',function(){
        return false;
    });

    $("#contacts").keyup(function(){
        if($(this).val().length > 0) {
            var valueToSubmit = $(this).serialize();
            var url = $(this).closest('form').attr('action');
            $.get(url, valueToSubmit, null, "script");
        }else{
            $("#results").empty();
        }
        return false;
    })

});

function close_box()
{
    $('.backdrop,  #searchBox').animate({'opacity':'0'}, 300, 'linear', function(){
        $('.backdrop,  #searchBox').css('display', 'none');
    });
}

