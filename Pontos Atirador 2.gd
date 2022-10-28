extends Label

func _ready():
	self.set_text("Atirador 2 = " + str(Global.pontosAti2))

func _physics_process(delta):
	self.set_text("Atirador 2 = " + str(Global.pontosAti2))
