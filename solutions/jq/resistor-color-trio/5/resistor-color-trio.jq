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

def result(val, unit):
  {
	value: $val,
	unit: $unit
  }
;

def get_unit:
  ((.[0] * 10 + .[1]) * pow(10; .[2])) as $val
  | log10($val) as $zeroes
  | if $zeroes < 3   then result($val, "ohms")
	elif $zeroes < 6 then result($val / 1000, "kiloohms")
	elif $zeroes < 9 then result($val / 1000000, "megaohms")
	else result($val / 1000000000, "gigaohms")

.colors | map(. | color_val) | get_unit
