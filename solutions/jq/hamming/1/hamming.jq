def prepare:
  {
	"strand1": .strand1 | split(""),
	"strand2": .strand2 | split("")
  }
;

def err(s1; s2):
  if (s1 | length) != (s2 | length) then "strands must be of equal length" | halt_error
  else .
  end
;

def hamming(s1; s2):
  [range(0; s1 | length)]
  | map(if s1[.] == s2[.] then 0 else 1 end)
  | add
  | if . == null then 0 else . end
;

(. | prepare) as $o
  | err($o.strand1; $o.strand2)
  | hamming($o.strand1; $o.strand2)
