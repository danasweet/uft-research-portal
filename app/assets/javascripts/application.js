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
//= require turbolinks
//= require_tree .
//= require bootstrap.min
$(document).ready(function(){

  $(".experiment_comment_box").css("display", "none");
  $(".cancel_experiment_comment").css("display","none");

  $(".experiment_comment_button").on("click",function(event){
    event.preventDefault();
    $(this).hide();
    $(".cancel_experiment_comment").show();
    $(this).next().show();
  });

  $(".cancel_experiment_comment").on("click",function(event){
    console.log("HEY");
    event.preventDefault();
    $(this).hide();
    $(".experiment_comment_box").hide();
    $(".experiment_comment_button").show();
  })

  $(".col-md-3").on("click",function(event){
    event.preventDefault();

  });
});
