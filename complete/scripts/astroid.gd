extends KinematicBody2D

export var speed:float
var dir:Vector2

func _ready():
	randomize()
	dir = Vector2(randf(), randf())

func _process(delta):
	move_and_collide(dir.normalized())
	warp(1280, 720)

func warp(max_x, max_y):
	var r = scale.x * 105.5
	if global_position.x > max_x + r:
		global_position.x = -r
	elif global_position.x < -r:
		global_position.x = max_x + r
	
	if global_position.y > max_y + r:
		global_position.y = -r
	elif global_position.y < -r:
		global_position.y = max_y + r

func get_rekt():
	if scale.x > .125:
		randomize()
		var a = duplicate()
		var b = duplicate()
		var d = Vector2(randf(), randf()).normalized() * scale.x * 64
		a.scale = scale/2
		b.scale = scale/2
		a.global_position = global_position + d
		b.global_position = global_position - d
		get_tree().root.add_child(a)
		get_tree().root.add_child(b)
	queue_free()