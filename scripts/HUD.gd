extends CanvasLayer
var totalscore = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.enemy_death.connect(_on_enemy_death)
	$Score.text = "Score: " + str(totalscore)
	$DeathMsg.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_enemy_death(score):
	totalscore += score
	$Score.text = "Score: " + str(totalscore)
	pass

func _on_player_gameover():
	$DeathMsg.show()
	pass # Replace with function body.


func _on_player_update_hp(hp):
	$HP.text = "HP: " + str(hp)
	pass # Replace with function body.
