//= require jquery
//= require jquery_ujs
//= require jquery.cssmap

$(function($){
  $('#map-south-america').cssMap({
    size: 750,
    'onClick': function(e){ showData(e); }
  });
});

showData = function(li){
  $('table.data-fields').hide();
  li.find('table.data-fields').show();
}
