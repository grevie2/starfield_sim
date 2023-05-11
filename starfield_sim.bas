'starfield simulation

WHITE=RGB(255,255,255)
angle = 180
origin_x = MM.HRes/2
origin_y = MM.VRes/2
dist_from_origin = 0
num_stars = 50
Dim stars(num_stars,3)

'initial values
For star = 0 To num_stars
  reset_star_values(x, y, offset, angle)
  stars(star, 0) = x
  stars(star, 1) = y
  stars(star, 2) = offset
  stars(star, 3) = angle
Next

loop_multiplier = 0.0025
num_cycles = 500
For Loop = 0 To num_cycles
  CLS
  For star = 0 To num_stars
    x = stars(star, 0)
    y = stars(star, 1)
    offset = stars(star, 2)
    angle = stars(star, 3)
    If (x > 0 And x < MM.HRes) And (y > 0 And y < MM.VRes) Then
    'update the star
      update_star_values(x, y, offset)
      stars(star,0) = x
      stars(star,1) = y
      stars(star,2) = offset
      Pixel stars(star,0), stars(star,1), WHITE
    Else
      reset_star_values(x, y, offset, angle)
      stars(star,0) = x
      stars(star,1) = y
      stars(star,2) = offset
      stars(star,3) = angle
    EndIf
  Next
  Pause 10
Next

Sub update_star_values(x, y, offset)
  x = Cint(x + offset * Cos(angle * Pi /180))
  y = Cint(y + offset * Sin(angle * Pi /180))
  offset = offset + (Loop * loop_multiplier)
End Sub

Sub reset_star_values(x, y, offset, angle)
  offset = dist_from_origin
  random_num = Math(RAND)
  angle = Cint(359 * random_num)
  random_num = Math(RAND)
  x = Cint(origin_x + offset * Cos(angle * Pi /180))
  y = Cint(origin_y + offset * Sin(angle * Pi /180))
  offset = offset + Cint(100 * random_num)
End Sub
