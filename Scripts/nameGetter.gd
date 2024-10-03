extends Control

var player_name = ""

func _ready():
	$Button.connect("pressed", self, "_on_start_game")

func _on_start_game():
	player_name = $LineEdit.text
	if player_name != "":
		get_tree().change_scene("res://Scenes/Profile.tscn")
	else:
		print("Veuillez entrer un nom.")
