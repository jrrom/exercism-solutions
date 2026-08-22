def to_binary:
  def go(acc; num):
	if   num <= 1 then (num | tostring) + acc
	elif num > 1  then go((num % 2) | tostring + acc; (num / 2) | floor)
	else "invalid input" | halt_error end
  ;
  . as $num
  | go(""; $num)
;

.number
	| to_binary
	| tostring
	| split("")
	| reduce .[] as $i (0; if $i == "1" then . += 1 else . end)
