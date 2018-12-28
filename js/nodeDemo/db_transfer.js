"use strict"

var fs = require('fs');

// 入参为从phpmyadmin中导出的建表sql语句，格式如下：
// 
// CREATE TABLE `exam` (
//   `id` int(11) NOT NULL,
//   `name` varchar(200) NOT NULL,
//   `start_time` datetime NOT NULL,
//   `end_time` datetime NOT NULL,
//   `school_id` int(11) DEFAULT NULL,
//   `school` varchar(200) DEFAULT NULL,
//   `mark` varchar(200) DEFAULT NULL,
//   `headcount` int(11) DEFAULT NULL COMMENT '招聘人数',
//   `signup_time` datetime DEFAULT NULL COMMENT '考试报名时间',
//   `exam_subject` varchar(200) DEFAULT NULL COMMENT '考试科目',
//   `signup_url` varchar(200) DEFAULT NULL COMMENT '报名地址',
//   `score_url` varchar(200) DEFAULT NULL COMMENT '成绩查询地址',
//   `hold` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否承办',
//   `invigilate_hire` smallint(5) NOT NULL COMMENT '监考人预招聘数',
//   `invigilate_fee` int(10) DEFAULT NULL
// ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

function dbTransfer (src, dst) {
	
	fs.readFile(src, function(err, data){
	    if(err){
	        console.log("read file error!")
	    }
	    else{
	        var sqlArr = data.toString().split('---');
			tableTransfer(sqlArr, dst);
	    }
	});
}	

function removeSpace (str) {
	// str = str.replace(/\ +/g,"");
	str = str.replace(/[\r\n]/g,"");
	return str;
}

// 将每一个表格的属性按行拆分并以追加写的方式写入文档
function tableTransfer (strArr, dst) {

	
	var arrLen = strArr.length;

	// 遍历所有数据表
	for(var index = 0; index < arrLen; index++) {

		if(strArr[index]) {
			var name = [];
			var type = [];
			var des = [];

			// 获取表名
			var tableTitle = strArr[index].split('(')[0].split('`')[1];
			tableTitle = '【' + tableTitle + '】表';

			// 获取表结构，去掉回车和换行
			var ele = removeSpace(strArr[index].split('` (')[1].split(') ENGINE=')[0].trim());
			ele = ele.split(',  ');

			// 获取属性名，中文介绍和类型
			for(var i = 0, len = ele.length; i < len; i++) {
				name.push(ele[i].split('`')[1]);
				type.push(ele[i].split('`')[2].split(' ')[1]);
				des.push(ele[i].split('\'')[ele[i].split('\'').length - 2]);
			}

			// 写入表格标题
			fs.appendFile(dst, '\n\n\n' + tableTitle + '\n', function (err) {
				if(err) {
					console.log('写入表格标题出错！');
				}
			});

			// 写入表格内容
			for(var i = 0, len = ele.length; i < len; i++) {
				var line = '|-- ' + name[i] + ' (' + des[i] + ') ' + type[i] + '\n';
				 
				fs.appendFile(dst, line, function (err) {
					if(err) {
						console.log('写入表格内容出错！');
					}
				});
			}
		}
	}	
}

function start () {
	// 读入文件
	var src = 'danceSql.txt';

	// 写入文件
	var dst ='danceDb.txt';
	
	dbTransfer(src, dst);
}

start();