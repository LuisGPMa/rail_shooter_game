extends KinematicBody2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
var speed : int = 60
var direction := Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("notifier").connect("screen_exited", self, "_on_screen_exited")

func _on_screen_exited():
	queue_free()
	
func set_direction(direction: Vector2):
	self.direction = direction
	print(direction)
	
func _process(delta: float):
	if direction != Vector2.ZERO:
		var velocity = direction*speed
		global_position += velocity
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
