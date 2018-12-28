/**
 * @Author    siuDong
 * @DateTime  2018-02-18
 * @copyright [copyright]
 * @license   [license]
 * @version   [version]
 * @return    [do segement]
 */

"use strict"

var fs = require('fs');
var Segment = require('node-segment').Segment;
// 需要过滤的字符
var throwWords = [',', '.', ':', '。', '“', '”'];


start();

function start () {
	var str = fs.readFile('./report/2月9日市场大跌点评天行有常,不为桀存,不为尧亡.txt', {encoding: 'utf8'}, function(err, data) {
		if(err) {
			console.error(err);
			return;
		}
		else {
			// console.log(data);
			doSegment(data);
		}
	})
}

function doSegment (str) {
	var segment = new Segment();
	segment.useDefault();
	var res = segment.doSegment(str);
	var temp = []

	res.forEach(function (item) {
		if(throwWords.indexOf(item.w) == -1) {
			temp.push(item.w);	
		}
	})

	console.log(temp);
}