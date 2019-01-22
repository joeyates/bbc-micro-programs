>LIST
   60INPUT"FILE :"A$
   70file=OPENOUT A$
   80INPUT"x,y :"j,k
   90INPUT"  s :"q
  100S%=255
  110H=q/128
  120FORJ%=0TO 127
  130FORK%=0TO 127
  140u=j+H*J%
  150v=k+H*K%
  160N%=-1:x=0:y=0
  170REPEAT
  180y2=y*y
  190x2=x*x
  200y=2*x*y+v
  210x=x2-y2+u
  220N%=N%+1
  230UNTIL N%=S% OR x2+y2>=4
  240BPUT #file,N%
  245PRINT J%,K%,N%
  250NEXT
  270NEXT
  280CLOSE#file
  290PRINT"fini"
  300END
>*FX3,0
