extends Node3D
@onready var basepoint = $Node3D
var goal_rot = 0
var rotspeed = 10

@onready var drone_focused = $Node3D/Marker3D

func _ready() -> void:
	check_focus()


func _process(delta: float) -> void:
	if goal_rot != basepoint.rotation.y:
		basepoint.rotation.y = lerp(basepoint.rotation.y, goal_rot, rotspeed * delta)
	#else: fvggvfgffgaddfjjkkkkyhgg
		#print("rstghe")

func _on_left_pressed() -> void:
	goal_rot = basepoint.rotation.y + deg_to_rad(90)
	await get_tree().create_timer(0.2).timeout
	check_focus()


func _on_right_pressed() -> void:
	goal_rot = basepoint.rotation.y + deg_to_rad(-90)
	await get_tree().create_timer(0.2).timeout
	check_focus()
	#rotation.y += deg_to_rad(-90)

func check_focus():
	drone_focused.focused_on = false
	for i in basepoint.get_children():
			if get_distance(drone_focused.global_position) > get_distance(i.global_position):
				drone_focused = i
			#if drone_focused.global_position - $Camera3D.global_position > i.global_position - $Camera3D.global_position:
	print(drone_focused)
	drone_focused.focused_on = true

func get_distance(pos: Vector3):
	return abs(pos - $Camera3D.global_position)


func _on_select_pressed() -> void:
	Global.drone = drone_focused.res
	get_tree().change_scene_to_file("res://test_world.tscn")
