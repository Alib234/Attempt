extends KinematicBody2D
const accel=1.1
const fall_speed=800
const gravity=200
const init_respawn_point=Vector2(-1447,-709)
const speed=250.0
var buffered_jump=false
var curr_respawn_point=Vector2(-1447,-709)
var ded=false
var ded_timer=Timer.new()
var health=3
var invuln=false
var invuln_timer=Timer.new()
var player_5hp=preload("res://player_5.png")
var player_4hp=preload("res://player_4.png")
var player_3hp=preload("res://player_3.png")
var player_2hp=preload("res://player_2.png")
var player_1hp=preload("res://player_1.png")
var player_0hp=preload("res://player_0.png")
var touching_ground=false
var tded=false
var velocity=Vector2()
func _ready():
	ded_timer.connect("timeout",self,"dedd")
	ded_timer.wait_time=3
	ded_timer.one_shot=true
	add_child(ded_timer)
	invuln_timer.connect("timeout",self,"uninvuln")
	invuln_timer.wait_time=2
	invuln_timer.one_shot=true
	add_child(invuln_timer)
func _physics_process(delta):
	velocity.x=velocity.x/accel
	if touching_ground==false&&velocity.y<=fall_speed&&ded==false:
		velocity.y=velocity.y+(delta*gravity)*8
	elif touching_ground==false&&velocity.y>=fall_speed&&ded==false:
		velocity.y=fall_speed
	if Input.is_action_pressed("ui_left")&&velocity.x>=-speed&&ded==false:
		velocity.x=velocity.x-(speed/12)/accel
	if Input.is_action_pressed("ui_right")&&velocity.x<=speed&&ded==false:
		velocity.x=velocity.x+(speed/12)/accel
	if touching_ground==true&&Input.is_action_just_pressed("ui_up")&&ded==false||buffered_jump==true&&Input.is_action_just_pressed("ui_up")&&ded==false:
		if buffered_jump==true:
			buffered_jump=false
		velocity.y=-300
		get_node("/root/Node2D/Sounds/Jump").playing=true
	if get_node("Player_Cast0").PCastCollision==true||get_node("Player_Cast1").PCastCollision==true:
		touching_ground=true
		buffered_jump=true
	else:
		touching_ground=false
	move_and_slide(velocity,Vector2(0,-1))
func _process(_delta):
	if health>=5:
		get_node("Player_Sprite").set_texture(player_5hp)
	elif health==4:
		get_node("Player_Sprite").set_texture(player_4hp)
	elif health==3:
		get_node("Player_Sprite").set_texture(player_3hp)
	elif health==2:
		get_node("Player_Sprite").set_texture(player_2hp)
	elif health==1:
		get_node("Player_Sprite").set_texture(player_1hp)
	elif health==0:
		get_node("Player_Sprite").set_texture(player_0hp)
		if tded==false:
			death()
	if is_on_floor()==true:
		velocity.y=0
	if get_node("Player_Cast2").PCastCollision==true||get_node("Player_Cast3").PCastCollision==true:
		velocity.y=0
	if get_node("Player_Cast4").PCastCollision==true||get_node("Player_Cast5").PCastCollision==true||get_node("Player_Cast6").PCastCollision==true||get_node("Player_Cast7").PCastCollision==true:
		velocity.x=0
	if ded==true:
		velocity.x=0
		velocity.y=0
func death():
	if health!=0:
		health=0
	if ded==false:
		ded=true
		get_node("/root/Node2D/Sounds/ded").playing=true
		ded_timer.start()
func dedd():
	get_node("/root/Node2D/Sounds/ded").playing=false
	tded=false
	ded=false
	health=3
	position=curr_respawn_point
func uninvuln():
	invuln=false
func _on_Acid_body_entered(body):
	if body.is_in_group("Player"):
		get_node("/root/Node2D/Sounds/damage").playing=true
		tded=true
		death()
func _on_Spikes_body_entered(body):
	if body.is_in_group("Player")&&invuln==false:
		get_node("/root/Node2D/Sounds/damage").playing=true
		health=health-1
		invuln_timer.start()
		invuln=true
func _on_CheckPoint_body_entered(body):
	if body.is_in_group("Player"):
		curr_respawn_point=Vector2(4888,848)
func _on_CheckPoint2_body_entered(body):
	if body.is_in_group("Player"):
		curr_respawn_point=Vector2(6736,1296)
func _on_CheckPoint3_body_entered(body):
	if body.is_in_group("Player"):
		curr_respawn_point=Vector2(1992,1048)
func _on_Rocket_body_entered(body):
	if body.is_in_group("Player")&&get_node("/root/Node2D").stage==2:
		get_tree().change_scene("res://Ending.tscn")
