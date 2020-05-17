extends KinematicBody2D

var motion = Vector2()
export var JumpSpeed = -900
export var motionSpeed = 300
const UP = Vector2(0, -1)

const GUNSHOT = preload("res://Gunshot.tscn")

func _physics_process(delta):
	motion.y += 20
	
	if Input.is_action_pressed("right"):
		motion.x = motionSpeed
		$Sprite.flip_h = false
		if sign($Position2D.position.x) == -1:
			$Position2D.position.x *= -1
	elif Input.is_action_pressed("left"):
		motion.x = -motionSpeed
		$Sprite.flip_h = true
		if sign($Position2D.position.x) == 1:
			$Position2D.position.x *= -1
	else:
		motion.x = 0
	
	if Input.is_action_just_pressed("shoot"):
		var gunshot = GUNSHOT.instance()
		if sign($Position2D.position.x) == 1:
			gunshot.set_gunshot_direction(1)
		else:
			gunshot.set_gunshot_direction(-1)
		get_parent().add_child(gunshot)
		gunshot.position = $Position2D.global_position

	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			motion.y = JumpSpeed
			get_node ("sounds/JUMP").play()
			

	motion = move_and_slide(motion, UP)
