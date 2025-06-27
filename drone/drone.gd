extends RigidBody3D

@export var thrust = 80.0
@export var pitch_sense = 20.0
@export var roll_sense = 20.0
@export var yaw_sense = 20.0

var base_thrust = 8.0
var cur_thrust: Vector3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_settings()


func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	
	
	var pitchdir = Input.get_axis("ui_up", "ui_down")
	if Input.get_axis("ui_up", "ui_down"):
		#transform.basis = transform.basis.rotated(Vector3.RIGHT, pitch_sense * pitchdir * delta)
		#rotation += Vector3(pitchdir * pitch_sense, 0, 0) * transform.basis.rotated()
		#rotate_object_local(Vector3.RIGHT, pitch_sense * pitchdir * delta)
		angular_velocity += global_transform.basis.x * Global.drone.pitch_sense * pitchdir * delta
	var rolldir = Input.get_axis("ui_left", "ui_right")
	if rolldir:
		angular_velocity += global_transform.basis.z * Global.drone.roll_sense * -rolldir * delta
		#rotate_object_local(Vector3.FORWARD, roll_sense * rolldir * delta)
		#transform.basis = transform.basis.rotated(Vector3.FORWARD, roll_sense * rolldir * delta)
	
	var yawdir = Input.get_axis("yaw_r", "yaw_l")
	if yawdir:
		#rotate_object_local(Vector3.UP, yaw_sense * yawdir * delta)
		#apply_angular(global_transform.basis)
		angular_velocity += global_transform.basis.y * Global.drone.yaw_sense * yawdir * delta
		#angular_velocity 
	
	if Input.is_action_pressed("trust"):
		cur_thrust += global_transform.basis.y * Global.drone.thrust_sense * delta
		#linear_velocity += global_transform.basis.y * Global.drone.thrust_sense * delta
		#linear_velocity = (rotation + Vector3(deg_to_rad(90), deg_to_rad(90), deg_to_rad(90))) * thrust # * delta
		#linear_velocity =# transform.basis. (Vector3.UP, thrust * delta)
		#linear_velocity = Vector3.UP * thrust * delta
	
	cur_thrust += global_transform.basis.y * base_thrust * delta
	linear_velocity += cur_thrust
	cur_thrust = Vector3.ZERO

func apply_angular(dir):
	pass

func update_settings():
	pass
