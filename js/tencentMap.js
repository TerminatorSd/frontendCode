"use strict";

window.onload = function () {
  initMap();
};


function initMap() { 

  // 获取当前位置
  var geolocation = new qq.maps.Geolocation("SS2BZ-BLOKV-W47PE-UNT6A-BUHU7-6BFLU", "shekao");
  var locOptions = {
    timeout: 6000
  };
  geolocation.getLocation(function (res) {

    // 获取当前位置成功，以当前位置为中心
    var mapOptions = {
      center: new qq.maps.LatLng(res.lat, res.lng),
      zoom: 13
    };
    var map = new qq.maps.Map(document.getElementById("container"), mapOptions);

    var scaleOptions = {
      align: qq.maps.ALIGN.BOTTOM_LEFT,
      margin: qq.maps.Size(85, 15),
      map: map
    }
    var scaleControl = new qq.maps.ScaleControl(scaleOptions);
  }, function () {

    // 获取当前位置失败
    alert('定位失败');
  }, locOptions);

}
