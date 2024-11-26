extends CharacterBody2D

@export var speed = 800

var dir : float
var spawn_rot : float
var spawn_pos : Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = spawn_pos
	rotation = spawn_rot
	velocity = Vector2.RIGHT.rotated(get_rotation()) * speed
	pass # Replace with function body.

func _physics_process(delta):
	#holy shit theft fuckin works
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		if collision.get_collider().has_method("hit"):
			collision.get_collider().hit()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	pass
