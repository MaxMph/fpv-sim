extends Node3D

@export var rotspeed = 10.0

func _process(delta: float) -> void:
	rotation.y += rotspeed * delta
