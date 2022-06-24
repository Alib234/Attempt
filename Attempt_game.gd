extends Node2D
var chase=false
var cutscene=false
var i=0
var stage=0
var stage_iterator=0
var tape_timer=Timer.new()
func _ready():
	get_node("Music/1_Square_mid").playing=true
	get_node("Music/2_Square_hi").playing=true
	get_node("Music/3_Triongel").playing=true
	get_node("Music/4_Drooms").playing=true
	get_node("Music/1_Square_mid").volume_db=-1000
	get_node("Music/2_Square_hi").volume_db=-1000
	get_node("Music/3_Triongel").volume_db=-1000
	get_node("Music/4_Drooms").volume_db=-1000
	tape_timer.connect("timeout",self,"tape_end")
	tape_timer.wait_time=35
	tape_timer.one_shot=true
	add_child(tape_timer)
func _process(_delta):
	if cutscene==false&&get_node("Music/2_Square_hi").volume_db<0&&stage>=0&&get_node("Player").ded==false:
		get_node("Music/2_Square_hi").volume_db=0
	elif cutscene==false&&get_node("Music/3_Triongel").volume_db<0&&stage>=1&&get_node("Player").ded==false:
		get_node("Music/3_Triongel").volume_db=0
	elif cutscene==false&&get_node("Music/3_Triongel").volume_db==0&&stage<1&&get_node("Player").ded==false:
		get_node("Music/3_Triongel").volume_db=-1000
	elif cutscene==false&&get_node("Music/1_Square_mid").volume_db<0&&stage>=2&&get_node("Player").ded==false:
		get_node("Music/1_Square_mid").volume_db=0
	elif cutscene==false&&get_node("Music/4_Drooms").volume_db<0&&chase==true&&get_node("Player").ded==false:
		get_node("Music/1_Square_mid").volume_db=0
	elif cutscene==false&&get_node("Music/4_Drooms").volume_db==0&&chase==false&&get_node("Player").ded==false:
		get_node("Music/1_Square_mid").volume_db=-1000
	if get_node("Player").ded==true:
		get_node("Music/1_Square_mid").volume_db=-1000
		get_node("Music/2_Square_hi").volume_db=-1000
		get_node("Music/3_Triongel").volume_db=-1000
		get_node("Music/4_Drooms").volume_db=-1000
	if get_node("Player").ded==true&&get_node("Player").curr_respawn_point==get_node("Player").init_respawn_point:
		stage=0
		stage_iterator=0
	if cutscene==true:
		get_node("Music/1_Square_mid").volume_db=-10
		get_node("Music/2_Square_hi").volume_db=-10
		get_node("Music/3_Triongel").volume_db=-10
func _on_Artifact_body_entered(body):
	if body.is_in_group("Player")&&stage_iterator==0:
		stage=1
		stage_iterator=1
		get_node("Sounds/fake_rock_destroy").playing=true
func _on_TriggerStage2_body_entered(body):
	if body.is_in_group("Player")&&stage_iterator==1:
		stage=2
		stage_iterator=2
func _on_Tape_body_entered(body):
	if body.is_in_group("Player"):
		get_node("/root/Node2D/Sounds/tape").playing=true
		tape_timer.start()
		cutscene=true
func tape_end():
	get_node("/root/Node2D/Sounds/tape").playing=false
	cutscene=false
