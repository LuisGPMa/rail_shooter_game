extends KinematicBody2D

const tiro = preload("res://Cenas/Tiro.tscn")
var delay = 0.2
var podeAtirar = true
export (int) var speed = 10
var rotation_dir := 0
onready var path_follow = get_parent()
onready var imagemMira = $Mira
onready var som = $Sprite/AudioStreamPlayer

func MovementLoop(delta):
	var prepos = path_follow.get_global_position()
	path_follow.set_offset(path_follow.get_offset() - speed*delta)
	var pos = path_follow.get_global_position()
	rotation_dir = (pos.angle_to_point(prepos) / 3.14)*180

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot_P1") and podeAtirar:
		shoot()
	if Input.is_action_just_pressed("slowdown_P1"):
		slowdown()
	if Input.is_action_just_released("speedup_P1"):
		speedup()
	if Global.miraAti1:
		imagemMira.visible = true
	else: 
		imagemMira.visible = false
	delay = Global.delayAtir1
		
func shoot():
	var t = tiro.instance()
	
	get_tree().get_root().add_child(t)
	t.atirador = 1
	t.nome = "atr1"
	t.position = $Pivot/Position2D.global_position
	t.global_rotation = $Pivot.global_rotation
	
	som.play()
	
	delay()
	
func delay():
	podeAtirar = false
	yield(get_tree().create_timer(delay), "timeout")
	podeAtirar = true
		
func slowdown():
	speed = 5
	
func speedup():
	speed = 15

func _physics_process(delta: float) -> void:
	MovementLoop(delta)
	pass
