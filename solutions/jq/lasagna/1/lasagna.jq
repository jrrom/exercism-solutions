(40 - (.actual_minutes_in_oven // 0)) as $rem
  | ((.number_of_layers // 1) * 2) as $prep
  | {
	"expected_minutes_in_oven": 40,
	"remaining_minutes_in_oven": $rem,
	"preparation_time": $prep,
	"total_time": (40 - $rem) + $prep
  }
