   10 CLS:PRINTTAB(2,3);"This program solves sets if simultaneousequations of the form:                       Ax1+Bx2+Cx3=D"
   20 PRINT"Please give the number of equations and then the co-efficients."TAB(10,22);"Press any key :";
   30 F$=INKEY$(0):IF F$="" THEN 30
   40 CLS:PRINTTAB(5,10);:INPUT "How many equations :"N
   50 PRINTTAB(10,22);"Press any key :";
   60 F$=INKEY$(0):IF F$="" THEN 60
   70 DIM A(2*N+1,N)
   80 FOR R=1 TO N
   90 CLS:PRINTTAB(10,3)"ROW ";R
  100 FOR C=1 TO N+1
  110 PRINT"Co-efficient ";C;"=";:INPUT A(C,R)
  120 NEXT C
  130 A(N+1+R,R)=1
  140 NEXT R
  150 
  160 
  170 FOR L=1 TO N-1
  180 D=A(L,L)
  190 FOR K=L TO 2*N+1
  200 A(K,L)=A(K,L)/D
  210 NEXT K
  220 FOR R=L+1 TO N
  230 D1=A(L,R)
  240 FOR C=L TO 2*N+1
  250 A(C,R)=A(C,R)-D1*A(C,L)
  260 NEXT C,R,L
  270 D=A(N,N)
  275 IF D=0 THEN PRINT "LIN. DEP.":STOP
  280 FOR K=N TO 2*N+1
  290 A(K,N)=A(K,N)/D
  300 NEXT K
  310 FOR L=N TO 2 STEP -1
  320 FOR R=L-1 TO 1 STEP -1
  330 FOR C=N+1 TO 2*N+1
  340 A(C,R)=A(C,R)-A(L,R)*A(C,L)
  350 NEXT C
  360 A(L,R)=0
  370 NEXT R,L
  380 CLS:PRINTTAB(5,3);"SOLUTIONS :"
  390 FOR M=1 TO N
  400 PRINT"X";M;"=";A(N+1,M)
  410 NEXT M
  420 PRINTTAB(10,22);"Press any key :";
  430 F$=INKEY$(0):IF F$="" THEN 430
  440 CLS:PRINTTAB(5,3);"INVERSE MATRIX"
  450 PRINT "INVERSE MATRIX ":FOR R=1 TO N
  460 FOR R=1 TO N
  470 FOR C=N+2 TO 2*N+1
  480 PRINT;A(C,R);" ";:NEXT C:PRINT:NEXT R
  490 END
