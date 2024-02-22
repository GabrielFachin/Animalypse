global.timer = 60000 //60

timer = global.timer



global.Eliminated = 0

global.MaxEnemies = 10 //10

global.Enemies = 0


global.WaveEnemies = 20

current_wave_enemies = global.WaveEnemies

current_wave = 1

ds_spawn_info = load_csv("vDay1W1.csv")

enum Spawner
{
	Event,
	Week,
	Day,
	Size,
	Level,
	Object,
	Lenght,
}
	
	enum Event 
	{
		Vanilla,
		Dungeon,
		Lenght,
	}
	
		enum Size
	{
		Small,
		Medium,
		Big,
		Lenght,
	}
	
	done = false
	
	_done = false