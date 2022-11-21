extends KinematicBody2D

const MOTION_SPEED = 460 # Pixels/second.
var camera = null;
var zoom_pos = 1.0;
	
func _ready():
	camera = get_node("Camera2D")

var position1 = [0,0]
var old_position1 = [0,0]

func _physics_process(_delta):
	var motion = Vector2()
	
	motion.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	motion.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	motion.y /= 2
	motion = motion.normalized() * MOTION_SPEED
	#warning-ignore:return_value_discarded
	#move_and_slide(motion)

	if isTouch == 0:
		self.position[0] += position1[0] - old_position1[0]
		self.position[1] += position1[1] - old_position1[1]
	
var isTouch = 0

func _input(event):
#	if event is InputEventMouseButton:# InputEventScreenTouch:# InputEventMouseButton:
#		old_position1 = position1
#		position1 = event.position
	isTouch = 0
	if event is InputEventMouseMotion:
		if event.is_pressed():
			isTouch = 1
		old_position1 = position1
		position1 = event.position


func _input1(event):
	if not event is InputEventScreenTouch:
		return

	if(event.is_pressed()):
		if(Input.is_key_pressed(KEY_ESCAPE)):
			get_tree().quit()
	
	var zoom = camera.get_zoom()
	
	if event is InputEventPanGesture:
		zoom[0] += event.delta.y
		zoom[1] += event.delta.y
		
	camera.set_zoom(zoom)
