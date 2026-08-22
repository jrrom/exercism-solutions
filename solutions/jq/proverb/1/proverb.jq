.strings as $ss
  | [range(0; ($ss | length) - 1)]
  | map("For want of a \($ss[.]) the \($ss[. + 1]) was lost.")
  | . + ["And all for the want of a \($ss[0])."]
  | if . == ["And all for the want of a null."] then [] else . end
