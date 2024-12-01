extends CharacterBody2D

var on_cooldown = false;
var movement_speed = 300
var hp = 12;
var alive = true
var target = null
signal kill;
@onready var projectile = preload("res://scenes/enemy_projectile.tscn")
@onready var _original_color = $Sprite2D.modulate


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
	$Sprite2D.modulate = Color.from_hsv(_original_color.h, 1, _original_color.v)
	await get_tree().create_timer(0.1).timeout
	$Sprite2D.modulate = Color.from_hsv(_original_color.h , 0, _original_color.v)

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("enemies")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if hp <= 0:
		SignalBus.enemy_death.emit(10)
		queue_free()
	
	
	if target != null:
		rotate(get_angle_to(target.position))
		if $RayCast2D.get_collider() == target && !on_cooldown:
			on_cooldown = true
			shoot()
			$Timer.start(0.7)
		
	pass


func _on_area_2d_body_entered(body):
	target = body
	pass # Replace with function body.


func _on_area_2d_body_exited(body):
	target = null
	pass # Replace with function body.


func _on_timer_timeout():
	on_cooldown = false
	pass # Replace with function body.
