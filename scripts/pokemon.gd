extends Control
class_name pokemon
signal pkmn_data()
signal return_mon_data()
signal random_pokemon()
var totodile = {"type": "Water", "type2": "none", "catch": 45, "base_stats": {"hp": 50, "atk": 65, "def": 64, "spd": 43}, "ability": "Torrent"}
var bulbasaur = {"type": "Grass", "type2": "Poison", "catch": 45, "base_stats": {"hp": 45, "atk": 49, "def": 49, "spd": 45}, "ability": "Overgrow"}
var charmander = {"type": "Fire", "type2": "none", "catch": 45, "base_stats": {"hp": 39, "atk": 52, "def": 43, "spd": 65}, "ability": "Blaze"}
var squirtle = {"type": "Water", "type2": "none", "catch": 45, "base_stats": {"hp": 44, "atk": 48, "def": 65, "spd": 43}, "ability": "Torrent"}
var cyndaquil = {"type": "Fire", "type2": "none", "catch": 45, "base_stats": {"hp": 39, "atk": 52, "def": 43, "spd": 65}, "ability": "Blaze"}
var chikorita = {"type": "Grass", "type2": "none", "catch": 45, "base_stats": {"hp": 45, "atk": 49, "def": 65, "spd": 45}, "ability": "Overgrow"}
var zigzagoon = {"type": "Normal", "type2": "none", "catch": 255, "base_stats": {"hp": 38, "atk": 30, "def": 41, "spd": 60}, "ability": "Pickup"}
var mudkip = {"type": "Water", "type2": "none", "catch": 45, "base_stats": {"hp": 50, "atk": 70, "def": 50, "spd": 40}, "ability": "Torrent"}
var torchic = {"type": "Fire", "type2": "none", "catch": 45, "base_stats": {"hp": 45, "atk": 60, "def": 40, "spd": 45}, "ability": "Blaze"}
var treecko = {"type": "Grass", "type2": "none", "catch": 45, "base_stats": {"hp": 40, "atk": 45, "def": 35, "spd": 70}, "ability": "Overgrow"}
var pkmn = {
	"zigzagoon": zigzagoon,
	"treecko": treecko,
	"mudkip": mudkip,
	"torchic": torchic,
	"totodile": totodile,
	"bulbasaur": bulbasaur,
	"charmander": charmander,"squirtle": squirtle,
	"cyndaquil": cyndaquil,
	"chikorita": chikorita,
}

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
