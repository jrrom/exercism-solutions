def prepare:
  trim
  | split("")
;

def filter:
  map(select(test("[a-z]|[A-Z]")))
;

def is_caps:
  filter
  | if . == [] then false else all(test("[A-Z]")) end
;

def is_question:
  .[-1] == "?"
;

def is_silence:
  all(test("\\s")) or . == []
;

def classify:
  if   is_silence  then "Fine. Be that way!"
  elif is_caps     and is_question then "Calm down, I know what I'm doing!"
  elif is_question then "Sure."
  elif is_caps     then "Whoa, chill out!"
  else "Whatever."
  end
;


.heyBob | prepare | classify
