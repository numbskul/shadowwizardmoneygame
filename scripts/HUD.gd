extends CanvasLayer
var totalscore = 0
var is_paused = false

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.enemy_death.connect(_on_enemy_death)
	$PauseMenu.hide()
	$Score.text = "Score: " + str(totalscore)
	$DeathMsg.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("pause_toggle"):
		pause()
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


func _on_restart_button_button_down():
	SignalBus.restart.emit()
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	pass # Replace with function body.
	
func pause():
	is_paused = !is_paused;
	get_tree().paused = is_paused
	if is_paused:
		$PauseMenu.show()
	else:
		$PauseMenu.hide()
