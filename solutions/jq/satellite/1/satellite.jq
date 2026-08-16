def build($pre; $ino):
  if ($pre | length) == 0 then
	{}
  else
	($pre[0]) as $root
	| ($ino | index($root)) as $i
	| {
	  v: $root,
	  l: build($pre[1 : 1 + $i]; $ino[0 : $i]),
	  r: build($pre[1 + $i :]; $ino[$i + 1 :])
	}
  end
;

def is_unique($arr):
  ($arr | length) == ($arr | unique | length)
;

.preorder as $pre
  | .inorder as $ino
  | if ($pre | length) != ($ino | length) then
      error("traversals must have the same length")
	elif (is_unique($pre) | not) or (is_unique($ino) | not) then
      error("traversals must contain unique items")
	elif ($pre | sort) != ($ino | sort) then
      error("traversals must have the same elements")
	else
      build($pre; $ino)
	end
