extends KinematicBody2D

export (int) var speed = 5
export (float) var rotation_speed = 1.5

export (PackedScene) var ProjetilBasico

var velocity := Vector2.ZERO
var rotation_dir := 0.0
onready var raycast = $Sprite/RayCast2D
var shotAvailable := true
var shotCooldownTimer
# Onready inicializa como se estivesse no callback _ready
onready var path_follow = get_parent()
onready var target = position
onready var sprite := $Sprite
onready var ponta_da_arma = $PontaDaArma


#onready var audioPlayer := $AudioPlayer

#onready var box := preload("res://Items/Box.tscn")

func MovementLoop(delta):
	var prepos = path_follow.get_global_position()
	path_follow.set_offset(path_follow.get_offset() - speed*delta)
	var pos = path_follow.get_global_position()
	rotation_dir = pos.angle_to_point(prepos)
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	shotCooldownTimer = $Timer
	shotCooldownTimer.connect("timeout", self, "_on_Timer_timeout")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot_P1") and shotAvailable:
		shoot()
	if Input.is_action_just_pressed("slowdown_P1"):
		slowdown()
	if Input.is_action_just_released("slowdown_P1"):
		speedup()
		
func _on_Timer_timeout():
	shotAvailable = true
		
func shoot():
	print(str(raycast.get_collider()))
	if raycast.is_colliding():
		Global.pontosAti2 -= 10
		print("Atirador 2 " + str(Global.pontosAti2))
	var projetilInstance = ProjetilBasico.instance()
	add_child(projetilInstance)
	projetilInstance.global_position = ponta_da_arma.global_position
	projetilInstance.set_direction(Vector2.RIGHT.rotated(rotation_dir))
	path_follow.get_global_position()
	shotAvailable = false
	shotCooldownTimer.start()
	
	print(get_viewport().size.x)
	print(get_viewport().size.y)
	
	
func slowdown():
	speed = 15
	
func speedup():
	speed = 25

func get_rotation_input():
	rotation_dir = 0
	velocity = Vector2.ZERO
	if Input.is_action_pressed("right"):
		rotation_dir += 1
	if Input.is_action_pressed("left"):
		rotation_dir -= 1
	if Input.is_action_pressed("down"):
		velocity = Vector2(-speed, 0).rotated(rotation)
	if Input.is_action_pressed("up"):
		velocity = Vector2(speed, 0).rotated(rotation)

func get_mouse_input():
	look_at(get_global_mouse_position())
	velocity = Vector2()
	if Input.is_action_pressed("down"):
		velocity = Vector2(-speed, 0).rotated(rotation)
	if Input.is_action_pressed("up"):
		velocity = Vector2(speed, 0).rotated(rotation)

func get_point_and_click():
	velocity = position.direction_to(target) * speed
	if position.distance_to(target) <= 5:
		velocity = Vector2.ZERO

func _physics_process(delta: float) -> void:
	MovementLoop(delta)
