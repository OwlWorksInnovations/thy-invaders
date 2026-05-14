extends Node2D

const WEAPON = preload("uid://b0pyoyiha70cn")
const ENEMY = preload("uid://cd5nuynr3dni3")
@onready var enemy_move_timer: Timer = $EnemyMoveTimer
@onready var enemies_container: Node2D = $EnemiesContainer

func _ready() -> void:
	# Spawn Enemies
	var start_pos: Vector2 = Vector2(34.0, 26.0)
	for x in range(14):
		start_pos.y = 26.0
		for y in range(4):
			var enemy := ENEMY.instantiate()
			enemies_container.add_child(enemy)
			enemy.global_position = start_pos
			start_pos.y += 40
		
		start_pos.x += 40

func _on_player_fired(player_global_postition: Vector2) -> void:
	var weapon := WEAPON.instantiate()
	add_child(weapon)
	weapon.global_position = player_global_postition

func _on_enemy_move_timer_timeout() -> void:
	enemies_container.position.x += 40
