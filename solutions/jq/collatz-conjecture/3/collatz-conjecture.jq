def steps:
  def go:
	if .number == 1 then .count
	elif .number % 2 == 0 then {number: .number / 2, count: .count + 1} | go
	else {number: .number * 3 + 1, count: .count + 1} | go
	end
  ;
  if . <= 0 then "Only positive integers are allowed" | halt_error(1)
  else {number: ., count: 0} | go end
;
