extends Control
class_name menu



func open():
	if Global.in_menu == false:
		Global.in_menu == true
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		show()

func close():
	Global.in_menu == false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	hide()
