def array_add:
  def go(acc; idx):
	if .[idx] == null then acc
	else go(acc + .[idx]; idx + 1) end
  ;
  . | go(0; 0)
;

def array_reverse:
  def go(acc; idx):
	if idx == -1 then acc
	else go(acc + [.[idx]]; idx - 1) end
  ;
  . | go([]; (. | length) - 1)
;

def array_map(f):
  def go(acc; idx):
	if .[idx] == null then acc
	else go(acc + [.[idx] | f]; idx + 1) end
  ;
  . | go([]; 0)
;
