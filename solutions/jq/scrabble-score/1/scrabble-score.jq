def get_val(c):
  if   c | inside(["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"]) then 1
  elif c | inside(["D", "G"]) then 2
  elif c | inside(["B", "C", "M", "P"]) then 3
  elif c | inside(["F", "H", "V", "W", "Y"]) then 4
  elif c == ["K"] then 5
  elif c | inside(["J", "X"]) then 8
  elif c | inside(["Q", "Z"]) then 10
  else 0 end
;

.word
	| trim
    | ascii_upcase
	| split("")
	| reduce .[] as $c (0; . += get_val([$c]))
