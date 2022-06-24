extends Area2D
var i=0
var j=0
func _physics_process(_delta):
	if rotation_degrees<=-25:
		i=1
	elif rotation_degrees>=25:
		i=0
	if scale>=Vector2(1,1):
		j=1
	elif scale<=Vector2(.75,.75):
		j=0
	if i==0:
		rotation_degrees=rotation_degrees-1
	elif i==1:
		rotation_degrees=rotation_degrees+1
	if j==0:
		scale=scale+Vector2(.01,.01)
	elif j==1:
		scale=scale-Vector2(.01,.01)
func _on_Tape_body_entered(body):
	if body.is_in_group("Player"):
		get_node("/root/Node2D/Sounds/battery").playing=true
		queue_free()
