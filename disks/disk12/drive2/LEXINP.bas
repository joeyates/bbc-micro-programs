   10INPUT"FILENAME :",G$:F$="L."+G$
   20Y%=OPENOUT F$
   30PRINT"Group 1"
   40INPUT"Title :",B$
   50PRINT#Y%,B$
   60FOR I%=1 TO 16
   70INPUTA$
   80PRINT#Y%,A$,1
   90NEXT I%
  100PRINT"Group 2"
  110 INPUT"Title :",C$
  120 PRINT#Y%,C$
  130FOR I%=1 TO 16
  140INPUTA$
  150PRINT#Y%,A$,2
  160NEXT I%
  170CLOSE#Y%
  180*RENAME INDEX OLD
  190Y%=OPENUP"OLD"
  200Z%=OPENOUT"INDEX"
  210INPUT#Y%,Q%
  220PRINT#Z%,Q%+1
  230FORI%=1 TO Q%
  240INPUT#Y%,D$,E$
  250PRINT#Z%,D$,E$
  260NEXTI%
  270PRINT#Z%,G$,B$+" and "+C$
  280CLOSE#0
  290*DEL. OLD