    5INPUT"Side 0 or 2"S%
   10INPUT"FILENAME :",G$
   15F$=":"+STR$(S%)+"."+G$
   20Y%=OPENUP F$
   23H$=":"+STR$(S%)+".NEW"
   25X%=OPENOUT H$
   30PRINT"Group 1"
   40INPUT#Y%,B$
   50PRINT"Title :";B$
   55B$=FNcorr(B$)
   57PRINT#X%,B$
   60FOR I%=1 TO 16
   70INPUT#Y%,A$,A%
   75PRINT A$
   80A$=FNcorr(A$)
   87PRINT#X%,A$,A%
   90NEXT I%
  100PRINT"Group 2"
  110INPUT#Y%,C$
  120PRINT"Title :";C$
  125C$=FNcorr(C$)
  127PRINT#X%,C$
  130FOR I%=1 TO 16
  140INPUT#Y%,A$,A%
  145PRINT A$
  150A$=FNcorr(A$)
  157PRINT#X%,A$,A%
  160NEXT I%
  170CLOSE#0
  180PRINT" *DELETE ";F$'" *RENAME ";H$;" ";F$
  195END
  199 
  200DEFFNcorr(D$)
  210INPUT E$
  220IF E$="" THEN 240
  230D$=E$
  240=D$
