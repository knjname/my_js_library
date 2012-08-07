###
bsd license
###

String::repeat = (count) -> ''.concat(@ for i in [0...count])
String::lpad = (length, chr = ' ') -> chr.repeat(length - @length) + str
String::rpad = (length, chr = ' ') -> str + chr.repeat(length - @length)

parse

strFormats =
	d : (val, fmt = ' ') ->
	x : () ->
	s : ->

###

%d, 3 -> 3
%02d, 3 -> 03

###
String::format = (args...) ->
	@.replace ///
	%(
		(?:\d*?d)
	)
	///gi, (_, format) ->
		f = format.slice -1
		farg = format.slice 0, -1
		strFormats[f].call null, args.pop, farg
	

do ->
	formats =
		y : -> @getFullYear()
		M : -> 
		'%' : -> '%'

	@dateFormat = (fmt, date = new Date()) ->
		fmt.replace /%([yMd%]|)/g, (_, format) -> formats[format].call date

	


