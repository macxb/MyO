extends KinematicBody

var speed = 100
var acceleration = 15
var mouse_sensitivity = 0.1
var direction = Vector3()
var velocity = Vector3()

onready var pivot = $Pivot
onready var gunpivot = $GunPivot

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
	if event is InputEventMouseMotion:
		rotate_y(deg2rad(-event.relative.x * mouse_sensitivity))
		pivot.rotate_x(deg2rad(-event.relative.y * mouse_sensitivity))
		pivot.rotation.x = clamp(pivot.rotation.x, deg2rad(-90), deg2rad(90))
		gunpivot.rotate_x(deg2rad(event.relative.y * mouse_sensitivity))
		gunpivot.rotation.x = clamp(pivot.rotation.x, deg2rad(-90), deg2rad(90))
		
func _physics_process(delta):
	
	direction = Vector3()
	
	if Input.is_action_just_pressed("move_forward"):
		
		direction -= transform.basis.z
		
	elif Input.is_action_just_pressed("move_backward"):
		
		direction += transform.basis.z

	elif Input.is_action_just_pressed("move_left"):
		
		direction -= transform.basis.x
		
	elif Input.is_action_just_pressed("move_right"):
		
		direction += transform.basis.x

	direction = direction.normalized()
	velocity = velocity.linear_interpolate(direction * speed, acceleration * delta)
	velocity = move_and_slide(velocity, Vector3.UP)

