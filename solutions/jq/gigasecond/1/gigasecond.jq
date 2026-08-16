if .moment | length == 10 then .moment + "T00:00:00Z" else .moment + "Z" end
  | fromdate
  | . + 1000000000
  | todate
  | sub("Z"; "")
