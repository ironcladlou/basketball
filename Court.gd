extends Node

func _ready():
	$ArmPath/ArmPathFollow.offset = 0.1
	set_process_input(true)

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

func _input(event):
	if event is InputEventMouseMotion:
		if event.relative.y < 0:
			$ArmPath/ArmPathFollow.offset += 0.05
		if event.relative.y > 0:
			$ArmPath/ArmPathFollow.offset -= 0.05
		if $ArmPath/ArmPathFollow.offset < 0.1:
			$ArmPath/ArmPathFollow.offset = 0.1
		if $ArmPath/ArmPathFollow.offset > 1:
			$ArmPath/ArmPathFollow.offset = 1

func reset():
	get_tree().reload_current_scene()
