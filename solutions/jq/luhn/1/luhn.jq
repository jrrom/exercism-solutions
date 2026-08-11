def is_bool:
  if . == true or . == false then true
  else false
  end
;

def check:
  if . == "0" then false
  elif test("^(\\s)*.$") then false # single character
  elif test("[.,-]") then false # no punctuation
  elif test("[!@#$%^&*:]") then false # symbols
  elif test("[a-zA-Z]") then false # no alpha
  else .
  end
;

def second(x):
  if (x * 2) > 9 then (x * 2) - 9
  else x * 2
  end
;

def luhn:
  gsub("\\s+"; " ")
  | split(" ")
  | add
  | split("")
  | map(tonumber)
  | . as $nums
  | [range(0; $nums | length; 1)]
  | map(if (. + 1) % 2 == 0 then second($nums[-(. + 1)]) else $nums[-(. + 1)] end)
  |	add
  | if . % 10 == 0 then true else false end
;

check
 | if is_bool then .
   else luhn end
