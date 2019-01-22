    5 E=0
   10 CLS
   20 PRINT ''"GO"
   30 T=TIME
   40 C=65
   50 REPEAT
   60 A$=GET$
   70 IF ASC(A$)=C THEN 80
   71 VDU 7
   72 E=E+1
   73 GOTO 60
   80 PRINT A$;
   90 C=C+1
  100 UNTIL C=91
  110 PRINT '(TIME-T)/100;" seconds."
  120 PRINT E;" errors."
