extends KinematicBody2D

const tiro = preload("res://Cenas/Tiro.tscn")
var delay = 0.1
var podeAtirar = true
export (int) var speed = 10
var rotation_dir := 0
onready var path_follow = get_parent()

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
		
func shoot():
	var t = tiro.instance()
	
	get_tree().get_root().add_child(t)
	t.position = $Pivot/Position2D.global_position
	t.global_rotation = $Pivot.global_rotation
	
	print("tiro" + str(t.position))
	
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
