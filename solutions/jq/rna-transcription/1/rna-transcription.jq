def toRna:
  split("")
  | map(
		if . == "G" then "C"
		elif . == "C" then "G"
		elif . == "T" then "A"
		else "U" end
	  )
  | add
  | if . == null then "" else . end
;
