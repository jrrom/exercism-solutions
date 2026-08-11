def rev(sentence):
  def go(s; l):
	if l == 0 then ""
	else
	  s[l - 1] + go(s[:(l - 1)]; l - 1)
	end
  ;
  go(sentence; sentence | length)
;

if .value == "" then ""
else
  rev(.value | split(""))
end
