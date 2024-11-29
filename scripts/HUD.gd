extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	$DeathMsg.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_gameover():
	$DeathMsg.show()
	pass # Replace with function body.


func _on_player_update_hp(hp):
	$HP.text = "HP: " + str(hp)
	pass # Replace with function body.
