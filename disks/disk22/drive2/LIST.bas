>LIST
   10 Y=OPENUP":2.F.CLASS"
   20 REPEAT
   30 INPUT#Y,A$
   35 PRINT A$
   40 A=GET
   50 UNTIL EOF#Y
   60 CLOSE#0
>*FX3,0