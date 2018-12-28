var fs = require('fs')

fs.createReadStream('test.js').pipe(fs.createWriteStream('test_cp.js'))
