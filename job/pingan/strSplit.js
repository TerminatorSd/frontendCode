function getQuery(url) {
    var res = {};
    var jsonArr = url.split('?')[1].split('&');
    jsonArr.forEach(function(val, index) {
        var keyValue = val.split('=');
        res[keyValue[0]] = keyValue[1];
    })
    console.log(JSON.stringify(res));
}
var str = 'https://asfasdfa.asdf.a.sfd?a=b&c=d&e=f';
getQuery(str);