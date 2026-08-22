
def classify(s):
  s
  | split("")
  | reduce .[] as $c ({}; if .[$c] == null then .[$c] = 1 else .[$c] += 1 end)
;


. as $original
  | classify(.subject) as $classified
  | .candidates
  | map(select($classified == classify(.)))
