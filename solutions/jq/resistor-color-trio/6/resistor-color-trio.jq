# Takes {color: [...]}
def color_val:
  {
	black: 0,
	brown: 1,
	red: 2,
	orange: 3,
	yellow: 4,
	green: 5,
	blue: 6,
	violet: 7,
	grey: 8,
	white: 9,
  }[.]
;

def result(value; unit):
  {
	"value": value,
	"unit" : unit
  }
;

def get_unit:
  ((.[0] * 10 + .[1]) * pow(10; .[2])) as $value
  | ($value | log10) as $zeroes
  | if   $zeroes < 3 then result($value; "ohms")
	elif $zeroes < 6 then result($value / 1000; "kiloohms")
	elif $zeroes < 9 then result($value / 1000000; "megaohms")
	else result($value / 1000000000; "gigaohms")
    end
;
		 
.colors | map(color_val) | get_unit
