// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require Chart.bundle
//= require chartkick
//= require_tree .

function appLookUp(appId){
  document.location = "/apps/" + appId;
}

function pointOfContactLookUp(pocId){
  document.location = "/point_of_contacts/" + pocId;
}

function staffLookUp(staffId){
  document.location = "/staffs/" +  staffId;
}

function toggleSidebar(){
  $("#wrapper").toggleClass("toggled");
  var className = $('#wrapper').attr('class');
}

function changeSidebarIcon(link){
  var className = $('#'+ link + '-icon').attr('class');
  if(className.includes('glyphicon-chevron-right')){
    $('#' + link + '-icon').removeClass('glyphicon-chevron-right').addClass('glyphicon-chevron-down');
  }else{
    $('#' + link + '-icon').removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-right');
  }
}

