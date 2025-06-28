extends menu

#@export var drone: drone_res

#@export var drones: Array[drone_res]

func _ready() -> void:
	#Global.drone = drone
	display()

func pitch_valuechanged(value: float) -> void:
	Global.drone.pitch_sense = value
	display()
	#%pitchvalue.text = str(drone.pitch_sense)
	#display()


func _on_rollslider_value_changed(value: float) -> void:
	Global.drone.roll_sense = value
	display()


func _on_yawslider_value_changed(value: float) -> void:
	Global.drone.yaw_sense = value
	display()

func display():
	%pitchvalue.text = str(Global.drone.pitch_sense)
	%pitchslider.value = Global.drone.pitch_sense
	
	%rollslider.value = Global.drone.roll_sense
	%rollvalue.text = str(Global.drone.roll_sense)
	%yawslider.value = Global.drone.yaw_sense
	%yawvalue.text = str(Global.drone.yaw_sense)
