extends CharacterBody2D

var speed = 700;
var cooldown = 0;
var hp = 100;

@onready var projectile = preload("res://scenes/projectile.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func shoot():
	var instance = projectile.instantiate()
	#set rot & pos, pos is offset to avoid spawning inside player
	var rot = rotation
	var pos = global_position
	instance.dir = rot
	instance.spawn_rot = rotation
	instance.spawn_pos = pos + (Vector2.RIGHT.rotated(rotation) * 50)
	#create bullet in world
	get_tree().root.add_child(instance)


func hit():
	hp -= 5
	
func get_input():
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_dir * speed

func _physics_process(delta):
	#no idea how this works, theft is good
	get_input()
	move_and_slide()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if hp <= 0:
		print("Game Over!")
	
	if cooldown > 0:
		cooldown -= 1;
	
	# Set rotation to face mouse
	rotate(get_angle_to(get_global_mouse_position()))
	
	# Check for shoot
	if Input.is_action_pressed("shoot") && cooldown <= 0:
		
		#play sfx
		$AudioStreamPlayer2D.play()
		#set cooldown
		cooldown = 8
		#load bullet
		shoot()
