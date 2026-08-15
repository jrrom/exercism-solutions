.phrase
  | ascii_downcase
  | split("")
  | map(select(test("[a-zA-Z]")))
  | sort as $o
  | [range(1; ($o | length) - 1)]
  | map($o[.] == $o[. - 1])
  | all(not)
