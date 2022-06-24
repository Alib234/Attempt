extends Control
func _on_BTN_QUIT_GAME_pressed():
	get_tree().quit()
func _on_BTN_MENU_pressed():
	get_tree().change_scene("res://Attempt_menu.tscn")
