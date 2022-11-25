extends Label

func _ready():
	self.set_text("Vida: " +	str(Global.pontosAti1))
	
func _physics_process(delta):
	self.set_text("Vida: " +	str(Global.pontosAti1))

