extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
func _physics_process(delta):
	if Input.is_action_pressed("ui_up"):
		$Ball.apply_impulse(Vector3(0, 0, 0), Vector3(0.5, 0.5, 0))
	if Input.is_key_pressed(KEY_R):
		reset()

func reset():
	get_tree().reload_current_scene()
