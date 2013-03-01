jQuery(function()
{
  //-- top menu pencil button --
  $(".btn-leftsider-toggle").click(function()
  {
    var newWidth = 0;
    if($(this).hasClass("active")) 
    {
      $(this).removeClass('active');      
      $("#leftpanel").css("left","-561px");
      $("#mapbuttons").css("left", "0px");
      $("#map_area").css("left", "0px");
      // newWidth = $(window).width();
      // $("#map_area").width(newWidth);

      if(openstreetmap) 
      {
        // var center = openstreetmap.getCenter();
        // var zoom = openstreetmap.getZoom();
        // openstreetmap.setView( center, zoom, true );
        // openstreetmap.fitBounds([[center.lat-1, center.lng-1],[center.lat+1, center.lng+1]]);
      }
    }
    else
    {
      $(this).addClass('active');
      $("#leftpanel").css("left","0px");
      $("#mapbuttons").css("left", "560px");
      $("#map_area").css("left", "560px");
      // newWidth = $(window).width() - 560;
      // $("#map_area").width(newWidth);
    }
  });
  //-- 
});