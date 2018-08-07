function snowflake(c, n, x, y, len){
	c.save();
	c.translate(x, y);
	c.moveTo(0, 0);
	leg(n);
	c.rotate(-120 * deg);
}
