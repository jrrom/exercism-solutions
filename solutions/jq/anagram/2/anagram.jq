
def classify(s):
  s
  | ascii_downcase
  | split("")
  | reduce .[] as $c ({}; if .[$c] == null then .[$c] = 1 else .[$c] += 1 end)
;


. as $original
  | classify(.subject) as $classified
  | .candidates
  | map(select($classified == classify(.) and (. | ascii_downcase) != ($original.subject | ascii_downcase)))
