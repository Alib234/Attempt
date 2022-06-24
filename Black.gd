extends Sprite
var i=0
var fade_timer=Timer.new()
func _ready():
	fade_timer.connect("timeout",self,"fade")
	fade_timer.wait_time=3
	fade_timer.one_shot=true
	add_child(fade_timer)
	fade_timer.start()
func _physics_process(delta):
	if i==0&&modulate.a<=1:
		modulate.a=modulate.a-0.01
	elif i==0&&modulate.a>0:
		modulate.a=0
		i=1
func fade():
	get_tree().change_scene("res://Attempt_menu.tscn")
