piercing = oWeapon.tot_piercing

image_xscale = max(1,oWeapon.bulletspeed/sprite_width)

enemies_hit = ds_list_create()

alpha = 1

travelled_distance = 0

locked = 0

isneon = false

_x = 0

_y = 0


intensity = 0.6
col = make_color_rgb(200,200,200)
radius = 0.1


damage = oWeapon.damage
size = oWeapon.projectile_size
_speed = oWeapon.bulletspeed



//tamanho da particula é igual ao tamanho do projetil
sizemin = size/1.5 
sizemax = size


//quantidade de particulas é relativo ao dano, sempre mantendo escala de 1 pra 2 do min pro max
partmin = max(2,floor(damage) /2)
partmax = max(4,floor(damage) )


//velocidade das pariticulas é definida pela velocidade da bala, valores iniciais beiram o 2.2 e 1.5
speedmin = _speed /15
speedmax = _speed /8