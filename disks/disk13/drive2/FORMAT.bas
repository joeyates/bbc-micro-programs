>LIST
    1 MODE 1
   10 DIM C$(10),P(10)
   20 Y=OPENUP ":2.BOOKS"
   30 REPEAT
   40 CLS:PRINT:PRINT:PRINT
   60 INPUT#Y,A$,T$,P$,I$,B$,N%,M%
   70 FOR I=1 TO M%
   80 INPUT#Y,C$(I),P(I)
   90 NEXT I 
  100 INPUT#Y,N$,N1$
  110 PROCPNT(A$):PRINT
  130 PROCPNT(T$):PROCPNT(P$)
  135 PRINTTAB(35,VPOS-(POS>33));"`";P(1)
  140 PRINT
  150 PROCPNT(I$):PROCPNT(B$):PROCPNT(N$):PROCPNT(N1$):PROCPNT(C$(1))
  160 IF M%=1 THEN 260
  165 IF POS<>0 THEN PRINT
  170 FOR I=2 TO M%
  180 PRINT
  210 PROCPNT("Another copy."+C$(I))
  215 PRINTTAB(35,VPOS-(POS>33));"`";P(I)
  220 NEXT I
  260 PRINT:PRINT:PRINT
  270 PRINT "Press any key to continue :";
  280 Y$=INKEY$(0):IF Y$="" THEN 280
  290 IF Y$="Q" THEN 310
  300 UNTIL EOF# Y
  310 CLOSE# Y 
  320 CLS:PRINT:PRINT
 1990 END
 2000 DEF PROCPNT(Q$)
 2010 IF POS+LEN(Q$)<40 THEN PRINT Q$;:ENDPROC
 2015 Q%=0
 2040 Q%=Q%+1:IF INSTR(" !),-.:;?]",MID$(Q$,Q%,1))=0 THEN 2040
 2050 IF Q%>=40-POS THEN PRINT:GOTO 2010
 2055 Q%=40-POS
 2080 Q%=Q%-1:IF INSTR(" !),-.:;?]",MID$(Q$,Q%,1))=0 THEN 2080
 2090 PRINT LEFT$(Q$,Q%)
 2100 Q$=RIGHT$(Q$,LEN(Q$)-Q%)
 2110 GOTO 2010
>*FX3,0
