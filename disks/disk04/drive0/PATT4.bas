   10 MODE 1
   20 A=200:B=200
   25 MODE 1
   30 C=RND(5):D=RND(5)
   35 E=RND(1000):F=RND(1000)
   40 FOR T=0 TO 2*PI STEP .01
   50 GCOL RND(4)-1,RND(4)
   60 VDU 19,RND(3),RND(16);0;
   70 R=SIN(C*T)+COS(D*T)
   80 X=R*COS(T)
   90 Y=R*SIN(T)
  100 PLOT 69,E,F
  110 PLOT 5,A*X+E,B*Y+F
  115 F$=INKEY$(0):IF F$<>"" THEN CHAIN"PATT1"
  120 NEXT T
  130 GOTO 20
