extends Node2D

@export var weapon_sprites: Array[Sprite2D] = []

func _ready() -> void:
	# Select random sprite by deleting randomly picked sprite
	#; Won't work with more than 2 sprites
	var weapon: Sprite2D = weapon_sprites.pick_random()
	weapon.queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
