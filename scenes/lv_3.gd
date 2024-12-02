extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.changelevel.connect(_on_changelevel)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_changelevel():
	get_tree().change_scene_to_file("res://scenes/lv_4.tscn")
