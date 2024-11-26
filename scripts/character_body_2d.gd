extends CharacterBody2D

var speed = 400;
var cooldown = 0;

@onready var projectile = preload("res://scenes/projectile.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func shoot():
	var instance = projectile.instantiate()
	#set rot & pos, pos is offset to avoid spawning inside player
	var rot = get_parent().rotation
	instance.dir = rot
	instance.spawn_rot = rot
	instance.spawn_pos = position + (Vector2.RIGHT.rotated(rot) * 50)
	#create bullet in world
	get_parent().add_child.call_deferred(instance)

func get_input():
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_dir * speed

func _physics_process(delta):
	#no idea how this works, theft is good
	get_input()
	move_and_slide()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if cooldown > 0:
		cooldown -= 1;
	
	# Set rotation to face mouse
	rotate(get_angle_to(get_global_mouse_position()))
	
	# Check for shoot
	if Input.is_action_pressed("shoot") && cooldown <= 0:
		
		#play sfx
		$AudioStreamPlayer2D.play()
		#set cooldown
		cooldown = 15
		#load bullet
		shoot()
