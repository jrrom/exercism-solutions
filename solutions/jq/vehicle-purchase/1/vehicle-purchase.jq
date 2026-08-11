def needs_license:
  . == "car" or . == "truck"
;

def choose_vehicle:
  reduce .[] as $vehicle (.[0]; if . < $vehicle then . else $vehicle end)
  | "\(.) is clearly the better choice."
;

def resell_price:
  if .age < 3 then .original_price * 0.8
  elif .age > 10 then .original_price * 0.5
  else .original_price * 0.7
  end
;
