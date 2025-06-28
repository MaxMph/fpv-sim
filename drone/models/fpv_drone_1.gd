extends Node3D

var spinning = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("trust"):
		spinning = true
		propspin()
	elif spinning == true:
		spinning = false
		propspin()

func propspin():
	if spinning == true:
		if $AnimationPlayer.is_playing() == false:
			$AnimationPlayer.play("props")
	elif $AnimationPlayer.is_playing():
		$AnimationPlayer.pause()
	
