/**
 * @Author    siuDong
 * @DateTime  2018-02-17
 * @copyright [copyright]
 * @license   [license]
 * @version   [version]
 * @function  get report of stocks
 */

"use strict"

var http = require('http')
var fs = require('fs');
var cheerio = require('cheerio');
var request = require('request');
var iconv = require('iconv-lite')
var page = 1;
var count = 1;
var name = [];
var url = 'http://vip.stock.finance.sina.com.cn/q/go.php/vReport_List/kind/strategy/index.phtml?p=1';

getPage(url);      // go

function getPage(url) {
      
    http.get(url, (res) => {     
  
        var chunks = [];   

     	//监听data事件，每次取一块数据
        res.on('data', (chunk) => {   
            chunks.push(chunk);
        });
     	//监听end事件，如果整个网页内容的html都获取完毕，就执行回调函数
        res.on('end', () => {

			var href = [];

        	var html = iconv.decode(Buffer.concat(chunks), 'gb2312');
   			var $ = cheerio.load(html, {decodeEntities: false});

   			// 获取文章列表
   			$('.tal a').each(function (item) {
   				href.push($(this).attr('href').trim());
   			})

   			// 依次获取该页面的所有文章
   			for(var i = 0,len = href.length; i < len; i++) {
   				// console.log(i + " " + href[i].slice(-19,-12));
   				getArticle(href[i]);
			}

			// // 跳转到下个页面，进行重复操作
			if(page < 2) {
				page += 1
				console.log('next page: now page ' + page);
				var nextUrl = url.split('=')[0] + '=' + page;
				getPage(nextUrl);
			}
          	
        });

    }).on('error', (err) => {
        console.log(err);
    });


}

// 获取某一篇文章的具体内容
function getArticle (url) {

	http.get(url, (res) => {     
  
        var chunks = [];   

        res.on('data', (chunk) => {   
            chunks.push(chunk);
        });

        res.on('end', () => {

        	var html = iconv.decode(Buffer.concat(chunks), 'gb2312');
   			var $ = cheerio.load(html, {decodeEntities: false});

   			// 读取正文内容 
   			var content = $('.blk_container').text();
   			var org = $('.creab span:nth-child(2) a').text();
   			var author = $('.creab span:nth-child(3) a').text();
   			var time = $('.creab span:last-child').text();
   			var title = $('.content h1').text();

   			console.log(title + ' 写入中...' + count++);
   			name.push(title);
   			// 写入本地文档
   			fs.writeFileSync('./report/' + title + '.txt', content
   				, (err) => {
			    if(err) 
			    	console.log('写文件操作失败......');
			    // else 
			    // 	console.log(title);
			    }
			);
        });

    }).on('error', (err) => {
        console.log(err);
    });
}

function haveRepeatedElement (href) {
	
	for(var i = 0, len = href.length; i < len; i ++) {
		for(var j = i +1; j < len; j++) {
			if(href[i] == href[j]) {
				console.log('发现重复元素: ' + i + " and " + j);
			}
		}
	}
}
