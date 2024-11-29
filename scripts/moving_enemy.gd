extends CharacterBody2D

var cooldown = 0;
var movement_speed = 300
var movement_target_position = null
var hp = 12;
var alive = true
var target = null
signal kill;
@onready var projectile = preload("res://scenes/enemy_projectile.tscn")
@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D

func actor_setup():
	# Wait for the first physics frame so the NavigationServer can sync.
	await get_tree().physics_frame
	

func set_movement_target(movement_target: Vector2):
	$NavigationAgent2D.target_position = movement_target

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
	hp -= randi_range(damage - 2, damage + 2)
	if hp < 0:
		hp = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	# These values need to be adjusted for the actor's speed
	# and the navigation layout.
	#$NavigationAgent2D.path_desired_distance = 4.0
	#$NavigationAgent2D.target_desired_distance = 4.0

	# Make sure to not await during _ready.
	actor_setup.call_deferred()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if hp <= 0:
		SignalBus.enemy_death.emit(20)
		queue_free()
	
	if cooldown > 0:
		cooldown -= 1
	
	if target != null:
		
		rotate(get_angle_to(target.position))
		if $RayCast2D.get_collider() == target:
			set_movement_target(target.position)
			if cooldown <= 0:
				shoot()
				cooldown = 30
		
	var current_agent_position: Vector2 = global_position
	var next_path_position: Vector2 = navigation_agent.get_next_path_position()

	velocity = current_agent_position.direction_to(next_path_position) * movement_speed
	move_and_slide()
	
	pass


func _on_area_2d_body_entered(body):
	target = body
	pass # Replace with function body.


func _on_area_2d_body_exited(body):
	target = null
	pass # Replace with function body.
