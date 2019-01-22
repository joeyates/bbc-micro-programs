   10REM PROG TO SOLVE THE EIGHT QUEENS
   20REM PROBLEM.
   25MODE1
   30PROCsetup
   40REPEAT PROCplacepiece
   50IF c%=8 PROCdisplay:c%=c%-1
   60UNTIL alldone
   70END
   80:
   90DEF PROCsetup
   95PROCgrid
  100DIM q%(8)
  110c%=0
  120ok=TRUE:bad=FALSE
  130alldone=FALSE:here=TRUE
  140ENDPROC
  150:
  160DEF PROCplacepiece
  170c%=c%+1
  175IF q%(8)=8 PROCgoback
  180REPEAT q%(c%)=q%(c%)+1
  190PROCcheck
  200UNTIL here=ok OR q%(c%)=8
  210IF here=bad PROCgoback
  220ENDPROC
  230:
  240DEF PROCgoback
  250REPEAT q%(c%)=0
  260c%=c%-1
  270UNTIL q%(c%)<>8 OR c%=1
  280c%=c%-1
  290IF c%<0 alldone=TRUE
  300ENDPROC
  310:
  320DEF PROCcheck
  330here=ok
  340IF c%=1 ENDPROC
  350IF q%(c%)<8 PROCup(c%)
  360IF q%(c%)>1 PROCdown(c%)
  370PROCback(c%)
  380ENDPROC
  390:
  400DEF PROCup(t%)
  420REPEAT t%=t%-1
  425diag%=q%(c%)+c%-t%
  430IF q%(t%)=diag% here=bad
  440UNTIL t%=1 OR diag%=8 OR here=bad
  450ENDPROC
  460:
  470DEF PROCdown(t%)
  490REPEAT t%=t%-1
  495diag%=q%(c%)+t%-c%
  500IF q%(t%)=diag% here=bad
  510UNTIL t%=1 OR diag%=1 OR here=bad
  520ENDPROC
  530:
  540DEF PROCback(t%)
  560REPEAT t%=t%-1
  570IF q%(t%)=q%(c%) here=bad
  580UNTIL t%=1 OR here=bad
  590ENDPROC
  600:
  610DEF PROCdisplay
  620FOR col%=1 TO 8
  625FOR row%=1 TO 8
  630PROCtriangle
  640NEXT row%,col%
  650REPEATUNTILGET=32
  660ENDPROC
  670:
  680DEF PROCgrid
  690FOR col%=0 TO 8
  700PLOT 69,200+100*col%,200
  710PLOT 5,200+100*col%,1000
  720PLOT 69,200,200+100*col%
  730PLOT 5,1000,200+100*col%
  740NEXT col%
  750ENDPROC
  760:
  770DEF PROCtriangle
  780IF q%(col%)=row% GCOL 0,3 ELSE GCOL 0,0
  790PLOT 69,112+100*col%,112+100*row%
  800PLOT 69,188+100*col%,112+100*row%
  810PLOT 85,150+100*col%,188+100*row%
  820ENDPROC
