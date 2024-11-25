extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $RayCast2D.is_colliding():
		if $RayCast2D.get_collider() is CharacterBody2D:
			$RayCast2D.get_collider().queue_clear()
		rotate(90)
		$AudioStreamPlayer2D.play()
	else:
		position += Vector2.UP.rotated(rotation) * 15;
	pass
