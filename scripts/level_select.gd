extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_lv_1_button_down():
	get_tree().change_scene_to_file("res://scenes/lv_1.tscn")
	pass # Replace with function body.


func _on_lv_2_button_down():
	get_tree().change_scene_to_file("res://scenes/lv_2.tscn")
	pass # Replace with function body.


func _on_lv_4_button_down():
	get_tree().change_scene_to_file("res://scenes/lv_4.tscn")
	pass # Replace with function body.
