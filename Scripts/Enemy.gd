extends AnimatedSprite2D
class_name Enemy

var maxHealth: int = 255
var currentHealth: int = 255

func _ready():
	$Health.max_value = maxHealth
	$Health.value = currentHealth
	play("idle")
	$Dragon.play("idle")

func take_damage(damage: int) -> void:
	currentHealth -= damage
	$Health.value = currentHealth
	if currentHealth <= 0:
		die()

func die() -> void:
	print("Enemy is dead.")
	# Handle player death logic here
