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
//= require sb-admin-2
//= require select2
//= require metisMenu.min
//= require ckeditor/init
//= require bootstrap
//= require bootstrap.min
//= require select2
//= require bootstrap-select
//= require iview
//= require jquery.easing
//= require menu3d
//= require raphael-min
//= require retina-1.1.0.min
//= require style-switch
//= require gmap3
//= require html5shiv
//= require jquery.elevatezoom
//= require respond.min
//= require selectivizr
//= require scripts
//= require_tree.


$(function() {
  $(document).on("click", ".pagination a" , function() {
    $.getScript(this.href);
    return false;
  });
  $("#products_search div button").on('click', function() {
    $.get($("#products_search").attr("action"), $("#products_search").serialize(), null, "script");
    return false;
  });

	$(document).on('click', "a#edit_qty_cart_user", function() {
    
    var _this = $(this);
    var link = "/carts/update_qty";
    $.ajax({
		type: "get",
		url: link,
		data: $("#view_carts").serialize(),
		success: function(res){
      if (res.tb!=null){
        alert(res.tb);
      }
      $("#total_cart").html("<span class='sym'>$</span>"+res.total);
      $.each( res.session_cart, function( key, value ) {
        $('#amount_cart_' + key).html("<span class='sym' >$</span>"+value["amount"]);
      });
		}
	});	
    return false;
  });

  // $(document).on('click', "a#add_to_cart", function() {
  //   var _this = $(this);
  //   var link = "http://localhost:3000/carts/create_ajax";
  //   $.ajax({
  //   type: "get",
  //   url: link,
  //   data: $("#product_add_carts").serialize(),
  //   success: function(res){
  //     alert(res.tb);
  //      document.getElementById("count_items_carts").innerHTML = res.cart_size +"Item";

  //   }
  // }); 
  //   return false;
  // });

 });
