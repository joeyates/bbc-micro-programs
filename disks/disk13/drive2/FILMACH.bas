*LOAD FILMACH

   10 PROCINIT
   20 MODE 1
   30 PLOT 69,700,250
   40 FOR T=0 TO 2*PI+.5 STEP .5
   50 PLOT 5,350*(COS(T)+1),250*(SIN(T)+1)
   60 NEXT T
   70 PLOT 69,690,360
   80 FOR T=0 TO 2*PI+.5 STEP .5
   90 PLOT 5,300*(COS(T)+1.3),200*(SIN(T)+1.8)
  100 NEXT T
  110 DIM A%(100,2)
  120 S%=0:PROCPUSH(200,490)
  130 GCOL 0,1
  140 PROCFILL
  150 PROCPUSH(150,300)
  160 GCOL 0,2
  170 PROCFILL
  180 END
  190 DEFPROCFILL
  200 REPEAT
  210 X%=A%(S%,1):Y%=A%(S%,2):S%=S%-1
  220 REPEAT
  230 ?V%=Y% MOD 256
  240 ?(V%+1)=Y% DIV 256
  250 CALL AD
  260 Y%=?V%+256*?(V%+1)
  270 UNTIL FNPNT(X%,Y%)
  280 Y%=Y%-4
  290 IF POINT(X%+4,Y%)=0 THEN PROCPUSH(X%+4,Y%)
  300 IF POINT(X%-4,Y%)=0 THEN PROCPUSH(X%-4,Y%)
  310 PLOT 69,X%,Y%
  320 REPEAT
  330 IF POINT(X%+4,Y%)=0 AND POINT(X%+4,Y%+4) THEN PROCPUSH(X%+4,Y%)
  340 IF POINT(X%-4,Y%)=0 AND POINT(X%-4,Y%+4) THEN PROCPUSH(X%-4,Y%)
  350 Y%=Y%-4
  360 UNTIL POINT(X%,Y%-4)
  370 PLOT 5,X%,Y%
  380 UNTIL S%=0
  390 ENDPROC
  400 
  410 DEF PROCPUSH(J%,K%)
  420 IF A%(S%,1)=J% AND A%(S%,2)=K% THEN 460
  430 S%=S%+1
  440 A%(S%,1)=J%
  450 A%(S%,2)=K%
  460 ENDPROC
  470 DEF PROCINIT
  480 V%=&C0E
  490 DIM Q% 100
  500 FOR C=0 TO 2 STEP 2
  510 P%=Q%
  520 [OPT C
  530 .AD LDX #4
  540 LDY V%
  550 .TP INY
  560 CPY #0
  570 BNE MD
  580 INC V%+1
  590 .MD DEX
  600 BNE TP
  610 STY V%
  620 RTS 
  630 ]NEXT C
  640 ENDPROC
  650 DEF FNPNT(K%,L%)
  670 LOCAL X%,Y%
  680 ?(V%+2)=K% MOD 256
  690 ?(V%+3)=K% DIV 256
  700 ?(V%+4)=L% MOD 256
  710 ?(V%+5)=L% DIV 256
  720 A%=9:X%=(V%+2) MOD 256:Y%=(V%+2) DIV 256
  730 CALL &FFF1
  740 =?(W%+6)


   10 PROCINIT
   20 MODE 1
   30 PLOT 69,700,250
   40 FOR T=0 TO 2*PI+.5 STEP .5
   50 PLOT 5,350*(COS(T)+1),250*(SIN(T)+1)
   60 NEXT T
   70 PLOT 69,690,360
   80 FOR T=0 TO 2*PI+.5 STEP .5
   90 PLOT 5,300*(COS(T)+1.3),200*(SIN(T)+1.8)
  100 NEXT T
  110 DIM A%(100,2)
  120 S%=0:PROCPUSH(200,490)
  130 GCOL 0,1
  140 PROCFILL
  150 PROCPUSH(150,300)
  160 GCOL 0,2
  170 PROCFILL
  180 END
  190 DEFPROCFILL
  200 REPEAT
  210 X%=A%(S%,1):Y%=A%(S%,2):S%=S%-1
  220 REPEAT
  230 ?V%=Y% MOD 256
  240 ?(V%+1)=Y% DIV 256
  250 CALL AD
  260 Y%=?V%+256*?(V%+1)
  270 UNTIL FNPNT(X%,Y%)
  280 Y%=Y%-4
  290 IF POINT(X%+4,Y%)=0 THEN PROCPUSH(X%+4,Y%)
  300 IF POINT(X%-4,Y%)=0 THEN PROCPUSH(X%-4,Y%)
  310 PLOT 69,X%,Y%
  320 REPEAT
  330 IF POINT(X%+4,Y%)=0 AND POINT(X%+4,Y%+4) THEN PROCPUSH(X%+4,Y%)
  340 IF POINT(X%-4,Y%)=0 AND POINT(X%-4,Y%+4) THEN PROCPUSH(X%-4,Y%)
  350 Y%=Y%-4
  360 UNTIL POINT(X%,Y%-4)
  370 PLOT 5,X%,Y%
  380 UNTIL S%=0
  390 ENDPROC
  400 
  410 DEF PROCPUSH(J%,K%)
  420 IF A%(S%,1)=J% AND A%(S%,2)=K% THEN 460
  430 S%=S%+1
  440 A%(S%,1)=J%
  450 A%(S%,2)=K%
  460 ENDPROC
  470 DEF PROCINIT
  480 V%=&C0E
  490 DIM Q% 100
  500 FOR C=0 TO 2 STEP 2
  510 P%=Q%
  520 [OPT C
  530 .AD LDX #4
  540 LDY V%
  550 .TP INY
  560 CPY #0
  570 BNE MD
  580 INC V%+1
  590 .MD DEX
  600 BNE TP
  610 STY V%
  620 RTS 
  630 ]NEXT C
  640 ENDPROC
  650 DEF FNPNT(K%,L%)
  670 LOCAL X%,Y%
  680 ?(V%+2)=K% MOD 256
  690 ?(V%+3)=K% DIV 256
  700 ?(V%+4)=L% MOD 256
  710 ?(V%+5)=L% DIV 256
  720 A%=9:X%=(V%+2) MOD 256:Y%=(V%+2) DIV 256
  730 CALL &FFF1
  740 =?(W%+6)

