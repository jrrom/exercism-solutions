def err_mgr(msg):
  msg | halt_error
;

def s(sl):
  def go(acc; i):
	.[i : (i + sl)] as $v
	| if ($v == []) then acc
	  else go(acc + [$v | add]; i + 1)
	  end
  ;
  go([]; 0) | map(select(length == sl))
;

.sliceLength as $sl
  | .series
  | tostring
  | split("")
  |	if length == 0    then err_mgr("series cannot be empty")
	elif length < $sl then err_mgr("slice length cannot be greater than series length")
	elif $sl == 0     then err_mgr("slice length cannot be zero")
	elif $sl <  0     then err_mgr("slice length cannot be negative")
	else
	  s($sl)
	end
