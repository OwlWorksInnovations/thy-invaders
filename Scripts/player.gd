extends CharacterBody2D

var speed: float = 300
var screen_size: Vector2
@onready var player_sprite: Sprite2D = $PlayerSprite

func _ready() -> void:
	screen_size = get_viewport_rect().size

func _process(delta: float) -> void:
	if Input.is_action_pressed("left"):
		position.x -= speed * delta
	if Input.is_action_pressed("right"):
		position.x += speed * delta
	
	var half_size = player_sprite.transform.get_scale() / 2
	position.x = clamp(position.x, half_size.x, screen_size.x - half_size.x)
