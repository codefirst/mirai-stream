// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//= require jquery
//= require jquery.slides
$(function(){
  $("#slides").slidesjs({
    width: 940,
    height: 528,
    play : {
      auto: true,
      interval: 15000
    },
    pagination: { active: false },
    navigation: { active : false },
    effect: {
      slide: {
        speed: 7500
      }
    }
  });
});
