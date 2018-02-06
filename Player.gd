extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export(int) var ARM_SPEED = 200

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _physics_process(delta):	
	if Input.is_key_pressed(KEY_W):
		$Torso/Bicep/Forearm.apply_impulse(Vector3(0, 0, 0), Vector3(0, 0.1, 0))
	if Input.is_key_pressed(KEY_S):
		$Torso/Bicep/Forearm.apply_impulse(Vector3(0, 0, 0), Vector3(0, -0.1, 0))
	if Input.is_key_pressed(KEY_O):
		$Torso/Bicep/Forearm/Hand.apply_impulse(Vector3(0, 0, 0), Vector3(0.1, 0, 0))
