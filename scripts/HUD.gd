extends CanvasLayer

signal levelwon
var totalscore = 0
var is_paused = false
var gamestarted = false
var playerdead = false

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.enemy_death.connect(_on_enemy_death)
	$PauseMenu.hide()
	$WinMenu.hide()
	$Score.text = "Score: " + str(totalscore)
	$DeathMsg.hide()
	$StartScreen.show()
	start_countdown()
	pass # Replace with function body.

func start_countdown():
	$StartScreen/StartTimer.start()
	get_tree().paused = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !gamestarted:
		$StartScreen/VBoxContainer/Countdown.text = str(ceil($StartScreen/StartTimer.time_left))
	if  get_tree().get_nodes_in_group("enemies").is_empty() && !playerdead:
		display_win_screen()
	pass

func display_win_screen():
	$WinMenu.show()
	levelwon	.emit()
	pass

func _on_enemy_death(score):
	totalscore += score
	$Score.text = "Score: " + str(totalscore)
	pass

func _on_player_gameover():
	$DeathMsg.show()
	playerdead = true
	pass # Replace with function body.


func _on_player_update_hp(hp):
	$HP.text = "HP: " + str(hp)
	pass # Replace with function body.


func _on_restart_button_button_down():
	SignalBus.restart.emit()
	get_tree().reload_current_scene()
	pass # Replace with function body.
	


func _on_start_timer_timeout():
	$StartScreen/VBoxContainer/Label.text = "Go!"
	get_tree().paused = false
	var gamestarted = true
	$Score.show()
	$HP.show()
	$StartScreen/VBoxContainer/Countdown.hide()
	await get_tree().create_timer(1).timeout
	$StartScreen.hide()
	pass # Replace with function body.
