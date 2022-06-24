extends Control
var version=ProjectSettings.get_setting("application/config/version")
var build=ProjectSettings.get_setting("application/config/build")
func _ready():
	get_node("Ver").text="Build number: "+str(build)+"\nVersion: "+str(version)
	get_node("OS_VER").text="OS: "+str(OS.get_name())
func _on_BTN_START_GAME_pressed():
	get_tree().change_scene("res://Attempt_game.tscn")
func _on_BTN_CONTROLS_pressed():
	get_tree().change_scene("res://Controls.tscn")
func _on_BTN_QUIT_GAME_pressed():
	get_tree().quit()
