extends CanvasLayer

# Références vers les ProgressBars
@onready var health_bar = $HealthBar
@onready var xp_bar = $XPBar

# Variables pour la vie et l'XP du joueur
var player_health = 100
var player_max_health = 100
var player_xp = 0
var xp_to_next_level = 100
var player_level = 1

# Fonction pour ajouter de l'XP au joueur
func add_xp(amount):
	player_xp += amount
	if player_xp >= xp_to_next_level:
		level_up()
	# Actualiser la barre d'XP
	xp_bar.value = player_xp

# Fonction de montée de niveau
func level_up():
	player_level += 1
	player_xp -= xp_to_next_level  # Conserver l'XP excédentaire
	xp_to_next_level *= 1.5  # Augmenter la difficulté pour le niveau suivant
	player_max_health += 20  # Augmenter la vie maximum à chaque niveau
	player_health = player_max_health  # Restaurer la vie après une montée de niveau
	print("Level Up! Nouveau niveau : " + str(player_level))
