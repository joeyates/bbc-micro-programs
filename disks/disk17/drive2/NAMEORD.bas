>LIST
    5 REM    TAKES INPUT FILE OF BOOKS           AND ORDERS THEM ALPABETICALLY.
   10 PROCNAME
   20 CLS
  100 M=12:DIM SL(M),SR(M)
  110 S=1:SL(1)=1:SR(1)=Q
  120 L=SL(S):R=SR(S):S=S-1
  130 I=L:J=R:X$=A$(INT((L+R)/2))
  140 IF A$(I)<X$ THEN I=I+1:GOTO 140
  150 IF X$<A$(J) THEN J=J-1:GOTO 150
  160 IF I>J THEN 190
  170 W$=A$(I):A$(I)=A$(J):A$(J)=W$
  180 I=I+1:J=J-1
  190 IF I<=J THEN 140
  200 IF I>=R THEN 220
  210 S=S+1:SL(S)=I:SR(S)=R
  220 R=J
  230 IF L<R THEN 130
  240 IF S<>0 THEN 120
  250 P=1:G=0
  252 REPEAT
  255 P=P+1
  260 IF A$(P)=A$(P+1) THEN 290
  265 G=G+1
  270 A$(G)=A$(P)
  290 UNTIL P=Q
  295 T=TIME
  300 X%=OPENOUT ":2.BOOKS"
  310 FOR I%=1 TO G
  315 PRINT A$(I%)
  320 Y%=OPENUP "BOOKS"
  330 REPEAT
  335 INPUT#Y%,A$,T$,P$,I$,B$,N%,M%
  345 FOR J%=1 TO M%:INPUT#Y%,C$(J%),P(J%):NEXT J%
  350 INPUT#Y%,N$,N1$
  360 IF A$<>A$(I%) THEN 390
  370 PRINT#X%,A$,T$,P$,I$,B$,N%,M%
  372 PRINT A$,T$,N%,M%;" ";(TIME-T) DIV 100;" SECS";" ";I%
  375 FOR J%=1 TO M%:PRINT#X%,C$(J%),P(J%):NEXT J%
  380 PRINT#X%,N$,N1$
  390 UNTIL EOF#Y%
  400 CLOSE#Y%
  410 NEXT I%
  980 CLOSE#0
  990 END
 1000 DEF PROCNAME
 1010 DIM A$(400),C$(10),P(10)
 1015 Q=1
 1020 Y=OPENUP "BOOKS"
 1030 REPEAT
 1040 INPUT#Y,A$(Q),T$,P$,I$,B$,N%,M%
 1045 PRINT A$(Q),Q
 1050 FOR I=1 TO M%:INPUT#Y,C$(I),P(I):NEXT I
 1060 INPUT#Y,N$,N1$
 1070 Q=Q+1
 1080 UNTIL EOF#Y
 1085 CLOSE#0
 1090 ENDPROC
>*FX3,0
