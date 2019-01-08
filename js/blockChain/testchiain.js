'use strict';

var Blcok = require('./block.js');
var Blockchain = require('./blockchain.js');

let savjeeCoin = new Blockchain();
savjeeCoin.addBlock(new Block(1, "20/07/2017", { amount: 4 }));
savjeeCoin.addBlock(new Block(2, "20/07/2017", { amount: 8 }));