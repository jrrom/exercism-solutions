def prepare:
  split("")
;

def is_caps:
  all(test("([A-Z]|\\?)"))
;

def is_question:
  .[-1] == "?"
;

def is_silence:
  all(test("\\s")) or . == []
;

def classify:
  if   is_caps and is_question then "Calm down, I know what I'm doing!"
  elif is_caps then "Whoa, chill out!"
  elif is_question then "Sure."
  elif is_silence then "Fine. Be that way!"
  else "Whatever."
  end
;


.heyBob | prepare | classify
