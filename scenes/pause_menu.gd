extends Control

var is_paused = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pause_toggle"):
		pause_toggle()
	pass

func pause_toggle():
	is_paused = !is_paused;
	get_tree().paused = is_paused
	if is_paused:
		show()
	else:
		hide()
		
func _on_quit_button_down():
	pass # Replace with function body.


func _on_main_menu_button_down():
	get_tree().paused = false
	SignalBus.restart.emit()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	pass # Replace with function body.


func _on_resume_button_down():
	pause_toggle()
	pass # Replace with function body.
