extends Node2D

var nbErreur = 0

func _ready():
	#var resource = load("res://Dialogue/qFacile.dialogue")
	#var dialogue_line = await DialogueManager.get_next_dialogue_line(resource, "Bienvenue")
	DialogueManager.show_dialogue_balloon(load("res://Dialogue/qFacile.dialogue"))
	return
	
func count_nb_Error():
	nbErreur+=1
