extends CharacterBody2D


var speed = 300
var player_chase = false
var player_shoot = false
var player = null

func _physics_process(delta: float) -> void:
	
	
	#rotate(get_angle_to(player.global_position()))
	
	var scene = preload("res://enemy projectile.tscn")
	var instance = scene.instantiate()
	if player_shoot == true:
		instance.rotate(rotation)
		instance.position = position
		get_parent().add_child(instance)
		

func _on_area_2d_body_entered(body: Node2D) -> void:
	player = body
	player_shoot = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	player = null
	player_shoot = false
