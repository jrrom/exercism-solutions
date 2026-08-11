(
  {result: "", number: .number} |
  if .number % 3 == 0 then {result: .result + "Pling", number: .number} else . end |
  if .number % 5 == 0 then {result: .result + "Plang", number: .number} else . end |
  if .number % 7 == 0 then {result: .result + "Plong", number: .number} else . end |
  if .result == "" then .number | tostring else .result end
)
