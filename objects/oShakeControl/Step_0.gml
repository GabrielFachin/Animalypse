xview = oCamera.x

yview = oCamera.y

view_xview = xview + random(shake);
view_yview = yview + random(shake) ;

view_yview = yview + random(shake) ;
if (abs(shake) > maxshake) {
    shake = maxshake * sign(shake) 
}

if (abs(shake) >= shakereduce) {
    shake -= shakereduce * sign(shake) 
} else {
    shake = 0;
}

