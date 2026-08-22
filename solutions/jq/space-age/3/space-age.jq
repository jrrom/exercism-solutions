def two_decimal: ((. * 100) | round) / 100;

def get_year(planet):
  {
	"Mercury": 0.2408467,
	"Venus"  : 0.61519726,
    "Earth"  : 1.0,
	"Mars"   : 1.8808158,
	"Jupiter": 11.862615,
    "Saturn" : 29.447498,
    "Uranus" : 84.016846,
    "Neptune": 164.79132
  }[planet]
;

try
  .seconds / (31557600 * get_year(.planet)) | two_decimal
catch "not a planet" | halt_error
