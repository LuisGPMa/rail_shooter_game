extends Label

func _ready():
	self.set_text("Atirador 1 = " +	str(Global.pontosAti1))
	
func _physics_process(delta):
	self.set_text("Atirador 1 = " +	str(Global.pontosAti1))

