extends AnimatedSprite2D
class_name Player

var maxHealth: int = 100
var currentHealth: int = 100
var xp: int = 0
var level: int = 1
var xpCap: int = 100

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
	get_parent().get_node("UI_Player/CanvasLayer/Panel/XPBar").value += amount*100/xpCap
	# level up
	if xp >= xpCap :
		level += 1
		get_parent().get_node("UI_Player/CanvasLayer/Panel/Level").text = "Level "+str(level)
		xp = xp - xpCap
		xpCap = xpCap * 2.5
		get_parent().get_node("UI_Player/CanvasLayer/Panel/XPBar").value = xp*100/xpCap
		if level > 1:
			get_parent().loadHard()

func die() -> void:
	print("Player is dead.")
	# Handle player death logic here
