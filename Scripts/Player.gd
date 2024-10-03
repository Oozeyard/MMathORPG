extends AnimatedSprite2D
class_name Player

var maxHealth: int = 100
var currentHealth: int = 100
var xp: int = 0
var level: int = 0
var xpCap: int = 0

@onready var animated_sprite = $AnimatedSprite2D

func _ready():
	$Health.max_value = maxHealth
	$Health.value = currentHealth
	play("idle")

func take_damage(damage: int) -> void:
	currentHealth -= damage
	$Health.value = currentHealth
	if currentHealth <= 0:
		die()

func gain_xp(amount: int) -> void:
	xp += amount
	# level up
	if xp >= xpCap :
		level += 1
		xp = xp - xpCap

func die() -> void:
	print("Player is dead.")
	# Handle player death logic here
