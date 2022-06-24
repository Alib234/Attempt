extends Area2D
var i=0
func _on_Switch_body_entered(body):
	if body.is_in_group("Player")&&i==0:
		get_node("Switch_S").flip_h=true
		get_node("/root/Node2D/Sounds/switch").playing=true
		i=i+1
