extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#check for collisions
	if $RayCast2D.is_colliding():
		# todo:
		# 1. change rotation so it just changes xy movement rather than rotates 90 deg randomly
		# 2. make collision behavior depend on object hit - destroy self & send signal on hit enemy or player
		rotate(90)
		$AudioStreamPlayer2D.play()
	else:
		position += Vector2.UP.rotated(rotation) * 15;
	pass
