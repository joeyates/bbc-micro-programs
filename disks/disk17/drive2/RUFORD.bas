
   10REM QUICK, ROUGH NAME ORDERING
   15 DIM C$(10),P(10)
   20 T=TIME
   30 X%=OPENOUT ":2.BOOKS"
   40 FOR LOOP=1 TO 26
   50 LOOP$=CHR$(LOOP+64)
   60 Y%=OPENUP "OLPRICE"
   70 REPEAT
   80 INPUT#Y%,A$,T$,P$,I$,B$,N%,M%
   90 FOR J%=1 TO M%:INPUT#Y%,C$(J%),P(J%):NEXT J%
  100 INPUT#Y%,N$,N1$
  110 IF LEFT$(A$,1)<>LOOP$ THEN 160
  120 PRINT#X%,A$,T$,P$,I$,B$,N%,M%
  130 PRINT A$,T$;" ";(TIME-T) DIV 100;" SECS"
  140 FOR J%=1 TO M%:PRINT#X%,C$(J%),P(J%):NEXT J%
  150 PRINT#X%,N$,N1$
  160 UNTIL EOF#Y%
  170 CLOSE#Y%
  180 NEXT LOOP
  190 CLOSE#0
  200 END

