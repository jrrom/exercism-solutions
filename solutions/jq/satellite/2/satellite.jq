def build($pre; $ino):
  if ($pre | length) == 0 then
    {}
  else
    ($pre[0]) as $root
    | ($ino | index($root)) as $i
    | {
      v: $root,
      l: build($pre[1:1+$i]; $ino[0:$i]),
      r: build($pre[1+$i:]; $ino[$i+1:])
    }
  end
;

def is_unique($arr):
  ($arr | length) == ($arr | unique | length)
;

.preorder as $pre
  | .inorder as $ino
  | if ($pre | length) != ($ino | length) then
      "traversals must have the same length" | halt_error
	elif (is_unique($pre) | not) or (is_unique($ino) | not) then
      "traversals must contain unique items" | halt_error
	elif ($pre | sort) != ($ino | sort) then
      "traversals must have the same elements" | halt_error
	else
      build($pre; $ino)
	  end
