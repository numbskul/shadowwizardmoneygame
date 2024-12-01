extends Control

var levels : Array
var level = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	levels = [
	"res://scenes/lv_1.tscn",
	"res://scenes/lv_2.tscn",
	"res://scenes.main_menu.tscn"
	]
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_next_level_button_down():
	SignalBus.restart.emit()
	SignalBus.changelevel.emit()
	pass # Replace with function body.


func _on_restart_button_down():
	SignalBus.restart.emit()
	get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_main_menu_button_down():
	SignalBus.restart.emit()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	pass # Replace with function body.
