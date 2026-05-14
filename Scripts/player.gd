extends CharacterBody2D

signal fired(player_global_postition: Vector2)

var speed: float = 300
var screen_size: Vector2
@onready var player_sprite: Sprite2D = $PlayerSprite

func _ready() -> void:
	screen_size = get_viewport_rect().size

func _process(delta: float) -> void:
	# Player movement
	if Input.is_action_pressed("left"):
		position.x -= speed * delta
	if Input.is_action_pressed("right"):
		position.x += speed * delta
	
	# Map boundaries
	var half_size: Vector2 = player_sprite.transform.get_scale() / 2
	position.x = clamp(position.x, half_size.x, screen_size.x - half_size.x)
	
	# Player firing
	if Input.is_action_just_pressed("fire"):
		fired.emit(global_position)
