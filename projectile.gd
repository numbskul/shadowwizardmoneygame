extends CharacterBody2D

@export var speed = 800

var dir : float
var spawn_rot : float
var spawn_pos : Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = spawn_pos
	rotation = spawn_rot
	velocity = Vector2.UP.rotated(get_parent().get_rotation()) * speed
	pass # Replace with function body.

func _physics_process(delta):
<<<<<<< Updated upstream
	if test_move(transform, Vector2.UP.rotated(get_parent().rotation) * 20):
		print("hit detected")
	move_and_collide(Vector2.UP.rotated(get_parent().rotation) * 20)
=======
	#holy shit theft fuckin works
	var collision = move_and_collide(velocity * delta)
	if collision:
		$AnimatedSprite2D2.flip_h = !$AnimatedSprite2D2.flip_h
		velocity = velocity.bounce(collision.get_normal())
		if collision.get_collider().has_method("hit"):
			collision.get_collider().hit()
>>>>>>> Stashed changes
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
<<<<<<< Updated upstream

=======
>>>>>>> Stashed changes
	pass
