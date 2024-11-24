extends CharacterBody2D

var speed = 400;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate(get_angle_to(get_global_mouse_position()))
	
	var vel = Vector2.ZERO;
	if Input.is_action_pressed("ui_up"):
		vel += Vector2.UP * speed;
	if Input.is_action_pressed("ui_down"):
		vel += Vector2.DOWN * speed;
	if Input.is_action_pressed("ui_left"):
		vel += Vector2.LEFT * speed;
	if Input.is_action_pressed("ui_right"):
		vel += Vector2.RIGHT * speed;
	
	position += vel * delta;
