    5 REM THIS PROGRAM SPLITS TEXT INTO COMPONENT WORDS AND COUNTS OCCURENCES.
   10 DIM W$(100),W(100)
   15 D=1
   25 INPUT I$
   26 IF I$="#" THEN END
   30 I$=I$+"*"
   35 A$=""
   40 A=1:B=1:L=LEN(I$)
   50 C$=""
   60 FOR I=1 TO L
   70 C$=MID$(I$,I,1)
   80 C=ASC(C$)
   90 IF C<65 OR C>90 AND C<97 OR C>122 THEN A$=A$+"*" ELSE A$=A$+C$
  100 NEXT I
  110 IF MID$(A$,B,1)="*" THEN B=B+1:GOTO 110
  120 IF B>L THEN 200
  130 A=INSTR(A$,"*",B)
  140 B$=MID$(A$,B,A-B)
  160 J=1
  170 IF W$(J)=B$ THEN W(J)=W(J)+1:GOTO 180
  171 J=J+1
  175 IF J<D THEN 170
  177 W$(D)=B$:W(D)=1:D=D+1
  180 B=A+1
  190 GOTO 110
  200 FOR J=1 TO D-1
  210 PRINT W$(J),W(J)
  220 NEXT J
  240 GOTO 25
