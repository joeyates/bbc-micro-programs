   10 J=0
   20 N=0
   30 MODE 2
   40 DIM C(16)
   50 C(1)=1:C(2)=2:C(3)=3:C(4)=4:C(5)=5:C(6)=6:C(7)=9:C(8)=10:C(9)=11:C(10)=12:C(11)=13:C(12)=14
   60 FX1=FNZ(1):GX1=FNZ(1)
   70 FX2=FNZ(1):GX2=FNZ(1)
   80 FX3=FNZ(1):GX3=FNZ(1)
   90 FX4=FNZ(1):GX4=FNZ(1)
  100 FY1=FNZ(1):GY1=FNZ(1)
  110 FY2=FNZ(1):GY2=FNZ(1)
  120 FY3=FNZ(1):GY3=FNZ(1)
  130 FY4=FNZ(1):GY4=FNZ(1)
  140 A=RND(1)
  150 B=RND(1)
  152 C=INT(RND(1)*5)
  154 D=INT(RND(1)*5)
  160 S=RND(1)
  170 FOR I=S TO 1000 STEP .01
  180 J=INT(RND(1)*6+1)
  190 K=INT(RND(1)*12+1)
  200 L=INT(RND(1)*12+1)
  210 GCOL C,C(J)
  220 VDU 19,C(K),C(L);0;
  225 VDU 19,C(L),C(K);0;
  230 IF J=12 THEN J=0
  240 PLOT 69,FNX(I,0,GX1),FNY(I,0,GY1)
  250 PLOT 69,FNX(I,A,GX2),FNY(I,A,GY2)
  260 PLOT 85,FNX(I,B,GX3),FNY(I,B,GY3)
  265 J=INT(RND(1)*6+1)
  266 GCOL D,C(J)
  270 PLOT 69,FNX(I,0,FX1),FNY(I,0,FY1)
  280 PLOT 69,FNX(I,A,FX2),FNY(I,A,FY2)
  290 PLOT 85,FNX(I,B,FX3),FNY(I,B,FY3)
  295 F$=INKEY$(0):IF F$<>"" THEN RUN
  300 NEXT I
  310 END
  320 DEF FNX(N,Z,M)=640*(SIN((N-Z)*M)+1)
  330 DEF FNY(N,Z,M)=493*(COS((N-Z)*M)+.998)
  340 DEF FNZ(X)=RND(1)*20-10
