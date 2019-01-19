   10 REM*******************************                                           CHANGE PROG SO IT WORKS IN FRACTIONS                                            ************************************
   20 CLS:PRINTTAB(2,3);
   30 PRINT"This program solves sets if simultaneousequations of the form:Ax1+Bx2+Cx3=D"
   40 PRINT"Please give the number of equations and then the co-efficients."TAB(10,22);"Press any key :";
   50 F$=INKEY$(0):IF F$="" THEN 50
   60 CLS:PRINTTAB(5,10);
   70 INPUT "How many equations :"N
   80 PRINTTAB(10,22);"Press any key:";
   90 F$=INKEY$(0):IF F$="" THEN 90
  100 DIM A(2*N+1,N)
  110 FOR R=1 TO N
  120 CLS:PRINTTAB(10,3)"ROW ";R
  130 FOR C=1 TO N+1
  140 PRINT"Co-efficient ";C;"=";:INPUT A(C,R)
  150 NEXT C
  160 A(N+1+R,R)=1
  170 NEXT R
  180 
  190 FOR L=1 TO N-1
  200 D=A(L,L)
  210 FOR K=L TO 2*N+1
  220 A(K,L)=A(K,L)/D
  230 NEXT K
  240 FOR R=L+1 TO N
  250 D1=A(L,R)
  260 FOR C=L TO 2*N+1
  270 A(C,R)=A(C,R)-D1*A(C,L)
  280 NEXT C,R,L
  290 D=A(N,N)
  300 IF D=0 THEN PRINT "LIN. DEP.":STOP
  310 FOR K=N TO 2*N+1
  320 A(K,N)=A(K,N)/D
  330 NEXT K
  340 FOR L=N TO 2 STEP -1
  350 FOR R=L-1 TO 1 STEP -1
  360 FOR C=N+1 TO 2*N+1
  370 A(C,R)=A(C,R)-A(L,R)*A(C,L)
  380 NEXT C
  390 A(L,R)=0
  400 NEXT R,L
  410 CLS:PRINTTAB(5,3);"SOLUTIONS :"
  420 FOR M=1 TO N
  430 PRINT"X";M;"=";A(N+1,M)
  440 NEXT M
  450 PRINTTAB(10,22);"Press any key :";
  460 F$=INKEY$(0):IF F$="" THEN 460
  470 CLS:PRINTTAB(5,3);"INVERSE MATRIX"
  480 PRINT "INVERSE MATRIX ":FOR R=1 TO N
  490 FOR R=1 TO N
  500 FOR C=N+2 TO 2*N+1
  510 PRINT;A(C,R);" ";:NEXT C:PRINT:NEXT R
  520 END
