extends StaticBody2D
func _on_Switch_body_entered(body):
	if body.is_in_group("Player"):
		position=Vector2(4192,1320)
