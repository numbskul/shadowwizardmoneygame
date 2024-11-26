extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta):
	if test_move(transform, Vector2.UP.rotated(get_parent().rotation) * 20):
		print("hit detected")
	move_and_collide(Vector2.UP.rotated(get_parent().rotation) * 20)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	pass
