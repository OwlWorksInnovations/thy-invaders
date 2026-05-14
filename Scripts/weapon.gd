extends Node2D

var speed: float = 300
@export var weapon_sprites: Array[Sprite2D] = []

func _ready() -> void:
	# Select random sprite by deleting randomly picked sprite
	#; Won't work with more than 2 sprites
	var weapon: Sprite2D = weapon_sprites.pick_random()
	weapon.queue_free()

func _process(delta: float) -> void:
	position.y -= speed * delta

func _on_axe_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy"):
		body.queue_free()
		queue_free()

func _on_spear_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy"):
		body.queue_free()
		queue_free()
