extends Area2D
func _on_Secret_body_entered(body):
	if body.is_in_group("Player"):
		get_node("/root/Node2D/Sounds/secret").playing=true
		queue_free()
