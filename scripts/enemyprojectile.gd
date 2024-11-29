extends CharacterBody2D

@export var speed = 1000

var bounces = 3
var dir : float
var spawn_rot : float
var spawn_pos : Vector2
var spawn_velocity : Vector2

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
		bounces -= 1
		velocity = velocity.bounce(collision.get_normal())
		rotation = velocity.angle()
		if collision.get_collider().has_method("hit"):
			collision.get_collider().hit(10)
			queue_free()
		if bounces <= 0:
			queue_free()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	pass
