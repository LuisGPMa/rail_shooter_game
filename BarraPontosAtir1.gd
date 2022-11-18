extends ProgressBar

func _ready():
	self.value = Global.pontosAti1
	
	
func _physics_process(delta):
	self.value = Global.pontosAti1

