extends KinematicBody2D
const accel=1.1
const fall_speed=800
const gravity=200
var i=0
var velocity=Vector2()
func _physics_process(delta):
	if i==1:
		if velocity.y<=fall_speed:
			velocity.y=velocity.y+(delta*gravity)*8
		elif velocity.y>=fall_speed:
			velocity.y=fall_speed
		move_and_slide(velocity,Vector2(0,-1))
func _on_FallingSpike_fall():
	i=i+1
