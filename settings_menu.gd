extends menu

@export var drone: drone_res

@export var drones: Array[drone_res]

func _ready() -> void:
	Global.drone = drone
	display()

func pitch_valuechanged(value: float) -> void:
	drone.pitch_sense = value
	display()
	#%pitchvalue.text = str(drone.pitch_sense)
	#display()

func display():
	%pitchvalue.text = str(drone.pitch_sense)
	%pitchslider.value = drone.pitch_sense
	
	%rollslider.value = drone.roll_sense
	%rollvalue.text = str(drone.roll_sense)
	%yawslider.value = drone.yaw_sense
	%yawvalue.text = str(drone.yaw_sense)

func _on_rollslider_value_changed(value: float) -> void:
	drone.roll_sense = value
	display()


func _on_yawslider_value_changed(value: float) -> void:
	drone.yaw_sense = value
	display()
