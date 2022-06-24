extends Area2D
signal fall
var i=0
func _on_FallingSpike_body_entered(body):
	if body.is_in_group("Player")&&i==0:
		var timer=Timer.new()
		timer.connect("timeout",self,"gone")
		timer.wait_time=10
		timer.one_shot=true
		add_child(timer)
		timer.start()
		get_node("/root/Node2D/Sounds/falling_spike").playing=true
		emit_signal("fall")
		i=i+1
func gone():
	queue_free()
