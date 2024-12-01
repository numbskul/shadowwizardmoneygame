extends CharacterBody2D

var speed = 700;
var on_cooldown = false;
var hp = 100;
var alive = true
var levelwon = false
signal gameover;
signal updateHP;

@onready var projectile = preload("res://scenes/projectile.tscn")
@onready var _original_color = $Body2.modulate

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


func hit(damage):
	if !levelwon:
		hp -= randi_range(damage - 2, damage + 2)
		if hp < 0:
			hp = 0
		updateHP.emit(hp)
		$Body2.modulate = Color.from_hsv(_original_color.h, 1, _original_color.v)
		$Arms2.modulate = Color.from_hsv(_original_color.h, 1, _original_color.v)
		await get_tree().create_timer(0.1).timeout
		$Body2.modulate = Color.from_hsv(_original_color.h , 0, _original_color.v)
		$Arms2.modulate = Color.from_hsv(_original_color.h, 0, _original_color.v)
		# Flash red / screenshake / some sort of hit indicator
	
func get_input():
	if alive && !levelwon:
		var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		velocity = input_dir * speed

func _physics_process(delta):
	#no idea how this works, theft is good
	get_input()
	move_and_slide()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if levelwon:
		velocity = Vector2.ZERO
	
	if hp <= 0:
		gameover.emit()
		alive = false
		$CollisionShape2D2.disabled = true
		velocity = Vector2.ZERO
		hide()
		
	
	# Set rotation to face mouse
	rotate(get_angle_to(get_global_mouse_position()))
	
	# Check for shoot
	if Input.is_action_pressed("shoot") && !on_cooldown && alive && !levelwon:
		
		#play sfx
		$AudioStreamPlayer2D2.play()
		#set cooldown
		$Timer.start(0.2)
		on_cooldown = true
		#load bullet
		shoot()


func _on_levelwon():
	levelwon = true
	pass # Replace with function body.


func _on_timer_timeout():
	on_cooldown = false
	pass # Replace with function body.
