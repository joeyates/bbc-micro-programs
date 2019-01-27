
    5REM READS DISC SECTOR IDS FROM ANY       SINGLE DENSITY DISC IN 8271 FORMAT
   10 DIM prog% 256,data% 12,sec% 256
   20 PROCass
   30 FOR TRK%=0 TO 79
   40 data%!1=sec%:data%?7=TRK%
   50 CALLseek
   60 data%!1=sec%:data%?7=TRK%
   70 CALLid
   80 FOR I=2 TO 38 STEP 4
   90 PRINT;" ";~sec%?I;
  100 NEXT I:PRINT;"* ";TRK%:NEXTTRK%
  110END
  120 DEF PROCass
  130 FOR PASS=0 TO 2 STEP 2
  140 P%=prog%
  150 [OPT PASS
  160 .id   LDA #0:STA data%
  170       LDA #3:STA data%+5
  180       LDA #&5B:STA data%+6
  190       LDA #0:STA data%+8
  200       LDA #&A:STA data%+9
  210       LDX #data%MOD256
  220       LDY #data%DIV256
  230       LDA #&7F
  240       JSR &FFF1
  250       RTS
  260 .seek LDA #0:STA data%
  290       LDA #1:STA data%+5
  300       LDA #&69:STA data%+6
  310       LDA #0:STA data%+8
  320       LDX #data%MOD256
  330       LDY #data%DIV256
  340       LDA #&7F
  350       JSR &FFF1
  360       RTS
  370 ]NEXT PASS
  380 ENDPROC

