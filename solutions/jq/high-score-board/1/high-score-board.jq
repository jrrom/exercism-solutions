def create_score_board:
  {
	"The Best Ever": 1000000
  }
;

def add_player(player; score):
  . + {
	  (player): score
	}
;

def remove_player(player):
  del(.[player])
;

def update_score(player; points):
  if has(player) then .[player] += points
  else add_player(player; points)
  end
;

def apply_monday_bonus:
  map_values(. + 100)
;

def total_score:
  reduce .[] as $item (0; . + $item)
;
