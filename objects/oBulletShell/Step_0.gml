if negative
if xdist < 0
{
x+= xdist * 0.15
xdist -= xdist * 0.15
}
else 
 if xdist > 0
{
x+= xdist * 0.15
xdist-= xdist * 0.15
}

if ydist > 0
{
y += ydist
ydist --
}