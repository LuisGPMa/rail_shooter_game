extends Label

func _ready():
	self.set_text("Vida: " + str(Global.pontosAti2))

func _physics_process(delta):
	self.set_text("Vida: " + str(Global.pontosAti2))
