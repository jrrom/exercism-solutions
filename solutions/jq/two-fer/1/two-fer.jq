# You might want to look at:
#
# - the alternative operator:
#   https://jqlang.github.io/jq/manual/v1.7/#alternative-operator
#
# - string interpolation:
#   https://jqlang.github.io/jq/manual/v1.7/#string-interpolation

def pname:
  "One for \(.), one for me."
;

if .name == null then "you" | pname
else .name | pname
end
								   
