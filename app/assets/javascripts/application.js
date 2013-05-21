// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require js/common
//= require js/jquery.accessibleList
//= require js/jquery.contextMenu
//= require js/jquery.modal
//= require js/jquery.tip

//= require js/mobile
//= require js/searchField


//= require_tree .

// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
$(document).ready(function() {
	$('.save_user').click (function(){
        
        if ($('.element').find('.password').val() != $('.element').find('.password_conf')){
        	$('.error_pass').css('display','block');		
        };
        
        if ($('.element input').each(function(){
        	if ($(this).val() == ''){
        		$('.error_empty').css('display','block');
        	};
        }));
        
     });
     
    $('#main-nav>ul li').click (function(){
    	$('#main-nav li').removeClass('current');
		$(this).addClass('current');
		$(this).children().children().eq(0).addClass('current');
		$('#main-nav>ul li.users>ul li a').css('color','white');
    });
    $('#main-nav>ul li.users>ul li a').css('color','white');
    
    $(document).ready(function() {	
		$('#main-nav ul li a').css('color','white');
  	});
  	
  	$("[type='tel']").css('width','96%').css('height','30px').css('background','white url(/assets/old-browsers-bg/input-bg.png) repeat-x top');
  	$("[type='email']").css('width','96%').css('height','30px').css('background','white url(/assets/old-browsers-bg/input-bg.png) repeat-x top')
  	$("[type='number']").css('width','96%').css('height','30px').css('background','white url(/assets/old-browsers-bg/input-bg.png) repeat-x top')
  	$("[type='url']").css('width','96%').css('height','30px').css('background','white url(/assets/old-browsers-bg/input-bg.png) repeat-x top')
  	
  	$('.controls-buttons>li a').click (function(){
    	$('.controls-buttons>li a').removeClass('current');
		$(this).addClass('current');
    });
    $('.controls-buttons>li:last-child').click (function(){
    	$('.controls-buttons>li a').removeClass('current');
    	window.location.reload(true);
		$('.controls-buttons>li:first-child').addClass('current');
		
    });
    
});
