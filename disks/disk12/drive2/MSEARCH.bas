    1REM SCANS MEMORY FOR GP OF BYTES            USE f4 TO CHANGE STRING TO HEX
    2*KEY 4 I.A$:FORI=1TOLEN(A$):P.~ASC(MID$(A$,I,1)):NEXTI|M
   10 DIM A(10)
   20 INPUT "No. of bytes :",N%
   30 INPUT"Hex start :",B$:B$="&"+B$
   35 INPUT"Hex end   :",E$:E$="&"+E$
   40 B%=EVAL(B$)-1:E%=EVAL(E$)-1
   50 FOR I=1 TO N%
   60 PRINT"Byte ";I;:INPUT A$
   70 A(I)=EVAL("&"+A$)
   80 NEXT I
   90 FOR C%=B% TO E%
  100 ok=TRUE:I%=0:REPEAT I%=I%+1
  110 IF ?(C%+I%-1)<>A(I%) THEN ok=FALSE
  120 UNTIL ok=FALSE OR I%=N%
  130 IF ok=FALSE THEN 150
  140 PRINT ~C%:A=GET
  150 NEXT C%
