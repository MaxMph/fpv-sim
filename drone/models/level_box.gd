extends VBoxContainer

@export var map: PackedScene
@export var hovering = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if hovering == false:
		_hovering()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _hovering():
	if hovering:
		modulate.a = 1.0
	else:
		modulate.a = 0.5
		


func _on_button_pressed() -> void:
	$"../../../.."._on_map_select_pressed(map)
