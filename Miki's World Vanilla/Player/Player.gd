extends KinematicBody2D

#Movement variables
var speed = 100
var gravity = 500.0
var jumpForce = 250.0
var vel = Vector2.ZERO

#Jump variables
export var jumpHeight:float = 650
export var jumpTimeToPeak:float = 4
export var jumpTimeToDescend:float = 3

export var jumpVelocity:float = ((2.0 * jumpHeight) / jumpTimeToPeak) * -1.0
export var jumpGravity:float = ((-2.0 * jumpHeight) / jumpTimeToPeak * jumpTimeToPeak) * -1.0
export var fallGravity:float = ((-2.0 * jumpHeight) / jumpTimeToDescend * jumpTimeToDescend) * -1.0

#Onready vars
onready var sprite = $Sprite
onready var anims = $AnimationPlayer

#Booleans
var isJumping = false

#Game variables
export(int) var coins_collected
export(int) var life
var max_health = 4

func _physics_process(delta):
	var moveX = (Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left"))
	
	#Flipping the sprite
	if moveX > 0:
		sprite.scale.x = -1
	elif moveX < 0:
		sprite.scale.x = 1
	
	#Jumps and gravity
	vel.x = moveX * speed
	vel.y += get_gravity() * delta
	if (Input.is_action_pressed("ui_accept") or Input.is_action_pressed("ui_up")) && is_on_floor():
		jump()
	
	#Player animations
	if moveX != 0 && is_on_floor():
		anims.play("Run")
	elif moveX == 0 && is_on_floor():
		anims.play("Idle")
	elif not is_on_floor():
		anims.play("Jump")
	
	vel = move_and_slide(vel, Vector2.UP)



func get_gravity() -> float:
	#If jumping returns jumpGravity and fallGravity while falling
	return jumpGravity if vel.y < 0 else fallGravity

func jump():
	vel.y = jumpVelocity

func _on_ItemChecker_area_entered(area):
	if area.is_in_group("GoldCoin"):
		coins_collected += 1
