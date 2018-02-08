extends Node

func _ready():
	$ArmPath/ArmPathFollow.offset = 0.1

func _physics_process(delta):
	if Input.is_action_pressed("ui_up"):
		$Ball.apply_impulse(Vector3(0, 0, 0), Vector3(0.5, 0.5, 0))
	if Input.is_key_pressed(KEY_R):
		reset()
	if Input.is_key_pressed(KEY_W):
		$ArmPath/ArmPathFollow.offset += 0.1
	if Input.is_key_pressed(KEY_S):
		$ArmPath/ArmPathFollow.offset -= 0.1

	# Bound movement
	if $ArmPath/ArmPathFollow.offset < 0.1:
		$ArmPath/ArmPathFollow.offset = 0.1
	if $ArmPath/ArmPathFollow.offset > 1:
		$ArmPath/ArmPathFollow.offset = 1

func _input(ev):
	print("Input event:" + ev.as_text())
	if ev is InputEventMouseMotion:
		print("Mouse motion event: x=" + str(ev.relative.x) + ",y=" + str(ev.relative.y))
	if ev is InputEventMouseButton:
		print("Mouse button event: pressed", str(ev.pressed))

func reset():
	get_tree().reload_current_scene()
