extends Control
signal text(text)
signal damage(entity,damage,text)
signal effects(entity,effect)
var opp = null


func _on_main_window_attack(Move, Entity, Stats, OStats):
	if Entity == "Player":
		opp = "Enemy"
	elif Entity == "Enemy":
		opp = "Player"
	match Move:
		"Slap":
			print(Entity)
			if Stats.atk /OStats.def / 2 <= 0:
				damage.emit(Entity,1,Entity+" Weakly slapped the "+opp)
			else:
				damage.emit(Entity,Stats.atk /OStats.def / 2,Entity+" Slapped the "+opp)
