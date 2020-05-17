extends Area2D

const SPEED = 500
var velocity = Vector2(0,0)
var direction = 1

func _ready():
	pass

func set_gunshot_direction(dir):
	direction = dir
	if dir == -1:
		$Sprite.flip_h = true
	
func _physics_process(delta):
	velocity.x = SPEED * delta * direction
	translate(velocity)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
