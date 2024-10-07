extends Node2D

var nbErreur = 0

func _ready():
	#var resource = load("res://Dialogue/qFacile.dialogue")
	#var dialogue_line = await DialogueManager.get_next_dialogue_line(resource, "Bienvenue")
	DialogueManager.show_dialogue_balloon(load("res://Dialogue/qMoyen.dialogue"))
	return
	
func incorrect(damage: int):
	nbErreur+=1
	$Enemy.play("attack")
	await $Enemy.animation_finished
	$Enemy.play("idle")
	$Gonzalez.take_damage(damage)


func correct(damage: int):
	$Gonzalez.play("attack")
	await $Gonzalez.animation_finished
	$Gonzalez.play("idle")
	#$UI_Player/CanvasLayer/Panel/XPBar.value += 60
	$Gonzalez.gain_xp(60)
	$Enemy.take_damage(damage)
	$Gonzalez.stop()

func loadEasy():
	DialogueManager.show_dialogue_balloon(load("res://Dialogue/qFacile.dialogue"))
	
func loadHard():
	DialogueManager.show_dialogue_balloon(load("res://Dialogue/qDifficile.dialogue"))
