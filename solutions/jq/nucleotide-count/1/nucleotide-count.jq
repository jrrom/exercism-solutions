def nucleotide_count(s):
  s as $s 
  | def go(i):
	  if $s[i] == null then .
	  else
		if   $s[i] == "G" then (.G += 1) | go(i + 1)
		elif $s[i] == "T" then .T += 1 | go(i + 1)
		elif $s[i] == "A" then .A += 1 | go(i + 1)
		elif $s[i] == "C" then .C += 1 | go(i + 1)
		else "Invalid nucleotide in strand" | halt_error
		 end
	  end
  ;

  {                               
	"G": 0,                         
	"T": 0,                         
	"C": 0,                         
	"A": 0                          
  } | go(0)
;

nucleotide_count(.strand | split(""))
