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

def val_unit:
  {
	"0": "ohms",
	"1": "ohms",
	"2": "ohms",
	"3": "kiloohms",
	"4": "kiloohms",
	"5": "kiloohms",
	"6": "megaohms",
	"7": "megaohms",
	"8": "megaohms",
	"9": "gigaohms"
  }[tostring]
;

.colors | map(. | color_val) | {
	value: (.[0] * 10 + .[1]) * pow(10; .[2]),
	unit: .[2] | val_unit
  }
