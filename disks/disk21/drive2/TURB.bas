>LIST
   10ON ERROR GOTO 180
   60MODE1
   70S%=255
   80line%=5:point%=69
   90VDU 28,30,31,39,0
  100INPUT'"x,s :"j,q
  110Q%=1024:M%=512
  120i=q/M%:I%=Q%/M%
  130style%=point%
  140FORJ%=0 TO M%-1
  150PROCplot
  160style%=line%
  170NEXT
  175A=GET
  180MODE7:PRINT'
  190END
  200DEF FNt(u)
  210N%=-1:x=0
  220REPEAT x=x-x*x+u:N%=N%+1
  230UNTIL N%=S% OR ABS(x)>100
  240=N%
  260DEF PROCplot
  270x=j+i*J%:Y%=FNt(x)*I%
  280X%=J%*I%:PLOT style%,X%,Y%
  290ENDPROC
>*FX3,0
