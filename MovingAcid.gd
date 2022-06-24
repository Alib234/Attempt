extends KinematicBody2D
var i=0
func _physics_process(_delta):
	if position.y<=1136:
		i=0
	elif position.y>=1200:
		i=1
	if i==0:
		position.y=position.y+.5
	elif i==1:
		position.y=position.y-.5
