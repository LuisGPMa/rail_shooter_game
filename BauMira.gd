extends Area2D

onready var sprite = $Sprite
onready var collision = $CollisionShape2D2
onready var timer = $Timer
var segundos = 5

func _on_Bau_body_entered(body):
	print("tiro no bau")
	print(body.nome)
	if body.nome == "atr1":
		self.global_position.x = 2000
		Global.miraAti1 = true
		sprite.visible = false
		collision.disabled = true 
		body.queue_free()
		timer.start(segundos)
		yield(timer,"timeout")
		Global.miraAti1 = false
	elif body.nome == "atr2":
		self.global_position.x = 2000		
		Global.miraAti2 = true
		sprite.visible = false
		collision.disabled = true 
		body.queue_free()
		timer.start(segundos)
		yield(timer,"timeout")
		Global.miraAti2 = false
	
	queue_free()
