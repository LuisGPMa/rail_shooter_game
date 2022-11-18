extends ProgressBar

func _ready():
	self.value = Global.pontosAti2
	
	
func _physics_process(delta):
	self.value = Global.pontosAti2

