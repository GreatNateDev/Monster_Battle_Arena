extends Control
class_name pokemon
signal pkmn_data()
signal return_mon_data()
signal random_pokemon()
func create_pokemon(type, type2, catch_rate, base_stats, ability):
	return {
		"type": type,
		"type2": type2,
		"catch": catch_rate,
		"base_stats": base_stats,
		"ability": ability
	}
var pkmn = {
	"totodile": create_pokemon("Water", "none", 45, {"hp": 50, "atk": 65, "def": 64, "spd": 43}, "Torrent"),
	"bulbasaur": create_pokemon("Grass", "Poison", 45, {"hp": 45, "atk": 49, "def": 49, "spd": 45}, "Overgrow"),
	"charmander": create_pokemon("Fire", "none", 45, {"hp": 39, "atk": 52, "def": 43, "spd": 65}, "Blaze"),
	"squirtle": create_pokemon("Water", "none", 45, {"hp": 44, "atk": 48, "def": 65, "spd": 43}, "Torrent"),
	"cyndaquil": create_pokemon("Fire", "none", 45, {"hp": 39, "atk": 52, "def": 43, "spd": 65}, "Blaze"),
	"chikorita": create_pokemon("Grass", "none", 45, {"hp": 45, "atk": 49, "def": 65, "spd": 45}, "Overgrow"),
	"zigzagoon": create_pokemon("Normal", "none", 255, {"hp": 38, "atk": 30, "def": 41, "spd": 60}, "Pickup"),
	"mudkip": create_pokemon("Water", "none", 45, {"hp": 50, "atk": 70, "def": 50, "spd": 40}, "Torrent"),
	"torchic": create_pokemon("Fire", "none", 45, {"hp": 45, "atk": 60, "def": 40, "spd": 45}, "Blaze"),
	"treecko": create_pokemon("Grass", "none", 45, {"hp": 40, "atk": 45, "def": 35, "spd": 70}, "Overgrow")}
func _on_main_window_type_requester(pokemoner):
	var data = pkmn.get(pokemoner)
	pkmn_data.emit(data.type,data.type2,data.base_stats,data.ability)
func RandMon():
	var keys = pkmn.keys()
	var random_key = keys[randi() % keys.size()]
	var value = pkmn[random_key]
	random_pokemon.emit(value.type,value.type2,random_key,value.base_stats,value.ability)
func get_pokemon_data(xname):
	var mon = pkmn[xname]
	return_mon_data.emit(mon.type,mon.type2,mon.base_stats,mon.ability)
func evodata(xname,old_name):
	var mon = pkmn[xname]
	var old = pkmn[old_name]
	return [mon.base_stats,mon.ability,old.base_stats]
