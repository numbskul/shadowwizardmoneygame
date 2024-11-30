extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$Credits.hide()
	$LevelSelect.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_button_button_down():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	pass # Replace with function body.


func _on_credits_button_button_down():
	$Credits.show()
	pass # Replace with function body.


func _on_level_select_button_button_down():
	$LevelSelect.show()
	pass # Replace with function body.


func _on_close_level_select_down():
	$LevelSelect.hide()
	pass # Replace with function body.


func _on_close_credits_button_down():
	$Credits.hide()
	pass # Replace with function body.
