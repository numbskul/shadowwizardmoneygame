extends TileMapLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var scene = preload("res://node_2d.tscn")
	var instance = scene.instantiate()
	add_child(instance)
	
	var enemy = preload("res://enemy.tscn")
	var inst = enemy.instantiate()
	inst.position += Vector2.DOWN * 400
	add_child(inst)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
