extends Node3D

@export var res: drone_res
@export var rotspeed = 1.8
var focused_on = false

func _process(delta: float) -> void:
	if focused_on:
		rotation.y += rotspeed * delta
