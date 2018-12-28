var name = 'world';

(function (){
  if (name == undefined) {
    console.log('hello undefined');
  } else {
    console.log('hello' + name);
  }
})();
