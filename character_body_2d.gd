extends CharacterBody2D

var speed = 400;
var cooldown = 0;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func get_input():
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_dir * speed

func _physics_process(delta):
	get_input()
	move_and_collide(velocity * delta)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if cooldown > 0:
		cooldown -= 1;
	
	# Set rotation to face mouse
	rotate(get_angle_to(get_global_mouse_position()))
	
	# Check for shoot
	if Input.is_action_just_pressed("shoot") && cooldown <= 0:
		$AudioStreamPlayer2D.play()
		cooldown = 40
		var scene = preload("res://projectile.tscn")
		var instance = scene.instantiate()
		instance.rotate(rotation)
		instance.position = position
		get_parent().add_child(instance)
