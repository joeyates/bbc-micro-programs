
    1REM ADDS UP PRICES
   10 Q=0:R=0:B=0
   20 DIM C$(10),P(10)
   30 Y=OPENUP "BOOKS"
   40 REPEAT
   50 INPUT#Y,aut$,ttl$,pub$,frm$,bnd$,box,num
   60 FOR I=1 TO num
   70 INPUT#Y,C$(I),P(I)
   80 B=B+1:Q=Q+P(I):IFP(I)=0THENR=R+1
   90 NEXT I 
  100 INPUT#Y,N$,N1$
  110 PRINT B,Q,R
  120 UNTIL EOF#Y
  130 CLOSE#Y
  150 END

