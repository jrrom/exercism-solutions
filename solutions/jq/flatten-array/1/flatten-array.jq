def flatten:
  reduce .[] as $i ([]; if   $i | type == "array"  then . += $i | flatten
							  elif $i | type == "number" then . += [$i]
							  elif $i == null then . += []
							  else . += [] end)
;

.array as $a
  | flatten
