def flatten_obj(o):
  (o.value | map({(. | ascii_downcase): o.key | tonumber})) | add
;

.legacy
  | to_entries
  | (reduce .[] as $o ({}; . + flatten_obj($o)))
