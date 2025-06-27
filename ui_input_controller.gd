extends Node

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("esc"):
		#get_tree().get_first_node_in_group("menu").close()
		for i in get_tree().get_nodes_in_group("menu"):
			if i.is_in_group("esc_menu") and i.visible == false:
				i.open()
			else:
				i.close()
