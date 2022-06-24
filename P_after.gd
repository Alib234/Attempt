extends StaticBody2D
func _on_Switch_body_entered(body):
	if body.is_in_group("Player"):
		position=Vector2(-2432,-728)
		get_node("/root/Node2D/Platforms/P_after2").position=Vector2(-2368,-760)
		get_node("/root/Node2D/Platforms/P_after3").position=Vector2(-2144,-824)
