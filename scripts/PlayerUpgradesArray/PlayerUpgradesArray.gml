function UpgradesArray()
{

enum Upgrades {
	Projectiles,
	Damage,
	AttackSpeed ,
	ProjectileSize ,
	PiercingAmount ,
	ClipSize,
	ReloadSpeed,
	ProjectileSpeed,
	FocusedShots,
	LifeSteal,
	Range,
	FocusMultiplier,
	Lenght
}
	
upgrades_array = [Upgrades.Lenght]

upgrades_array[Upgrades.Projectiles] =                                1    //projectiles ++
upgrades_array[Upgrades.Damage] =                                    0   //damage ++
upgrades_array[Upgrades.AttackSpeed] =                            1    //attack speed ++
upgrades_array[Upgrades.ProjectileSize] =                           0    //Projectile Size ++
upgrades_array[Upgrades.PiercingAmount] =                      0    //Piercing Amount ++
upgrades_array[Upgrades.ClipSize] =                                       0    //Clip Size ++
upgrades_array[Upgrades.ReloadSpeed] =                            0    //Reload Speed ++
upgrades_array[Upgrades.ProjectileSpeed] =                        0    //Projectile Speed ++
upgrades_array[Upgrades.FocusedShots] =                           0    //Focused Shots
upgrades_array[Upgrades.LifeSteal] =                                      0    //Life Steal
upgrades_array[Upgrades.Range] =                                          0    //Range
upgrades_array[Upgrades.FocusMultiplier] =                         0    //Focus Multiplier




}