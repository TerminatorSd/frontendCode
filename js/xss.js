
window.onload = function () {
  var para = location.href.split('?');
  var xsp = document.getElementsByClassName('xsp')[0];
  xsp.innerHTML = unescape(para[1]);
  logWindow();
  prompt('what is?')
  showModalDialog()
}

var logWindow = function () {
  console.log(window.location)
  console.log(window.navigator)
  console.log(window.screen)
}