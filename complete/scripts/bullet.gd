extends KinematicBody2D

export var speed:float
export var dir:Vector2

signal rekt

func _ready():
	rotation = dir.angle() - PI/2

func _process(delta):
	var c = move_and_collide(dir.normalized() * speed)
	if c:
		if c.collider.is_in_group("Astroid"):
			connect("rekt", c.collider, "get_rekt")
			emit_signal("rekt")
			disconnect("rekt", c.collider, "get_rekt")
		free()