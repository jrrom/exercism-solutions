# Given a numeric score between 0 and 100, output a letter grade
# - "A" is 90% - 100%
# - "B" is 80% - 89%
# - "C" is 70% - 79%
# - "D" is 60% - 69%
# - "F" is  0% - 59%

def letter_grade:
  if . >= 90 and . <= 100 then "A"
  elif . >= 80 and . <= 89 then "B"
  elif . >= 70 and . <= 79 then "C"
  elif . >= 60 and . <= 69 then "D"
  elif . >= 0  and . <= 59 then "F"
  else
	"Implement this function" | halt_error
  end
;


def count_letter_grades:
  reduce .[] as $s ({A: 0, B: 0, C: 0, D: 0, F: 0}; .[$s | letter_grade] += 1)
;
