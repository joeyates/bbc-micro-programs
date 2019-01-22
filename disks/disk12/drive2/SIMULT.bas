   10 PROCintro
   20 PROCsetup
   30 PROCinput
   40 FOR L=1 TO N-1
   50 divn=A(L,L,0):divd=A(L,L,1)
   60 FOR K=L TO 2*N+1
   70 A(K,L,0)=A(K,L,0)*divd
   80 A(K,L,1)=A(K,L,1)*divn
   90 NEXT K
  100 FOR R=L+1 TO N
  110 Dn=A(L,R,0):Dd=A(L,R,1)
  120 FOR C=L TO 2*N+1
  130 resn=Dn*A(C,L,0):resd=Dd*A(C,L,1)
  140 den=FNlowcommdenom(A(C,R,1),resd)
  142 A(C,R,0)=A(C,R,0)*(den/A(C,R,1))
  144 A(C,R,1)=den
  146 resn=resn*(den/resd)
  148 resd=den
  150 A(C,R,0)=A(C,R,0)-resn
  160 NEXT C,R,L
  170 divn=A(N,N,0):divd=A(N,N,1)
  180 IF divn=0 THEN PRINT "LIN. DEP.":STOP
  190 FOR K=N TO 2*N+1
  200 A(K,N,0)=A(K,N,0)*divd
  205 A(K,N,1)=A(K,N,1)*divn
  210 NEXT K
  220 FOR L=N TO 2 STEP -1
  230 FOR R=L-1 TO 1 STEP -1
  240 FOR C=N+1 TO 2*N+1
  241 dummy0=A(L,R,0)*A(C,L,0):dummy1=A(L,R,1)*A(C,L,1)
  242 den=FNlowcommdenom(A(L,R,1),A(C,R,1))
  244 dummy0=A(L,R,0)*(den/A(L,R,1))
  245 A(C,R,1)=den
  246 A(C,R,0)=A(C,R,0)*(den/A(C,R,1))
  250 A(C,R,0)=A(C,R,0)-dummy0
  260 NEXT C
  270 A(L,R,0)=0:A(L,R,1)=1
  280 NEXT R,L
  290 PROCresult
  300 END
  310DEF PROCintro
  320 CLS:PRINTTAB(2,3);
  330 PRINT"This program solves sets if simultaneousequations of the form:Ax1+Bx2+Cx3=D"
  340 PRINT"Please give the number of equations and then the co-efficients."TAB(10,22);"Press any key :";
  350 F$=INKEY$(0):IF F$="" THEN 350
  360 CLS:PRINTTAB(5,10);
  370 INPUT "How many equations :"N
  380 PRINTTAB(10,22);"Press any key:";
  390 F$=INKEY$(0):IF F$="" THEN 390
  400 ENDPROC
  410 DEF PROCdiv(N)
  420 FOR P=1 TO 15
  430 IF (A(N,1) MOD PR(P))=0 AND (A(N,2) MOD PR(P))=0 THEN A(N,1)=A(N,1)/PR(P):A(N,2)=A(N,2)/PR(P):PRINT PR(P):GOTO 430
  440 NEXT P
  450 ENDPROC
  460 DEF PROCsetup
  470 DIM A(2*N+1,N,1),PR(15)
  480 FOR I=1 TO 15
  490 READ PR(I)
  500 NEXT I
  510 ENDPROC
  520 DATA 2,3,5,7,11,13,17,19,23
  530 DATA 29,31,37,41,43,47,53
  540 DEF PROCinput
  550 FOR R=1 TO N
  560 CLS:PRINTTAB(10,3)"ROW ";R
  570 FOR C=1 TO N+1
  580 PRINT"Co-efficient ";C;"=";
  590 INPUT A(C,R,0):A(C,R,1)=1:A(N+C,R,1)=1
  600 NEXT C
  610 A(N+1+R,R,0)=1:A(N+1+R,R,1)=1
  620 NEXT R
  630 ENDPROC
  640 DEF PROCresult
  650 CLS:PRINTTAB(5,3);"SOLUTIONS :"
  660 FOR M=1 TO N
  670 PRINT"X";M;"=";A(N+1,M,0);" / ";A(N+1,M,1)
  680 NEXT M
  690 PRINTTAB(10,22);"Press any key :"
  700 F$=INKEY$(0):IF F$="" THEN 700
  710 CLS:PRINTTAB(5,3);"INVERSE MATRIX"
  720 FOR R=1 TO N
  730 FOR C=N+2 TO 2*N+1
  740 PRINT;A(C,R,0);" / ";A(C,R,1);"  ";:NEXT C:PRINT:NEXT R
  750 ENDPROC
  800 DEF FNlowcommdenom(A,B)
  810 lowcomm=A*B
  820 FOR I=1 TO 15
  830 IF A MOD PR(I)=0 AND B MOD PR(I)=0 THEN lowcomm=lowcomm DIV PR(I)
  840 NEXT I
  850 =lowcomm
