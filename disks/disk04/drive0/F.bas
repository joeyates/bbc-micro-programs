    5 REM  HIRES AREA FILLER
   10 base=10:OSWRCH=&FFEE:OSWORD=&FFF1
   20 MODE 1
   30 PLOT 69,700,250
   40 FOR T=0 TO 2.02*PI STEP .1
   50 PLOT 5,350*(COS(T)+1),250*(SIN(T)+1)
   60 NEXT T
   70 PLOT 69,690,360
   80 FOR T=0 TO 2*PI+.1 STEP .1
   90 PLOT 5,300*(COS(T)+1.3),200*(SIN(T)+1.8)
  100 NEXT T
  105 GCOL 0,1
  106 DIM H% 400,G% 600
  107 PROCassemble
  108 CALLfill
  109 END
  111 DEF PROCassemble
  112 FOR PASS=0 TO 2 STEP 2
  113 P%=G%
  114 [OPT PASS
  130 .fill LDA #base+4:STA H%+10
  140       LDA #200:STA H%+11
  145       LDA #0:STA H%+12
  150       LDA #234:STA H%+13
  155       LDA #0:STA H%+14
  160       JSR strt
  180       RTS
  290 .strt JSR pop
  300 .UP   LDY #2
  310       JSR add
  320       JSR pix
  330       JSR pnt
  340       BEQ UP
  350       LDY #2
  360       JSR sub
  370       JSR pix
  380       LDY #4
  390       JSR add
  400       JSR pnt
  410       BNE L2
  420       JSR push
  430 .L2   JSR pix
  440       LDY #4
  450       JSR sub
  460       JSR pnt
  470       BNE L4
  480       JSR push
  490 .L4   LDA #25:JSR OSWRCH
  500       LDA #69:JSR OSWRCH
  510       JSR plot
  520 .LOOP JSR pix
  530       LDY #4
  540       JSR add
  550       JSR pnt
  560       BNE L6
  570       LDY #6
  580       JSR add
  590       JSR pnt
  600       BEQ L6
  610       LDY #6
  620       JSR sub
  630       JSR push
  640 .L6   JSR pix
  650       LDY #4
  660       JSR sub
  670       JSR pnt
  680       BNE L8
  690       LDY #6
  700       JSR add
  710       JSR pnt
  720       BEQ L8
  730       LDY #6
  740       JSR sub
  750       JSR push
  760 .L8   LDY #2
  770       JSR sub
  780       JSR pix
  790       LDY #6
  800       JSR sub
  810       JSR pnt
  820       BEQ LOOP
  830       LDA #25:JSR OSWRCH
  840       LDA #05:JSR OSWRCH
  850       JSR plot
  860       LDA H%+10
  870       CMP #base
  880       BEQ end
  890       JMP strt
  900 .end  RTS
  910 .push LDY H%+10
  920       LDX #0
  930 .T3   LDA H%,Y
  940       CMP H%+4,X
  950       BNE yes
  960       INY:INX
  970       CPX #4
  980       BNE T3
  990       JMP NO
 1000 .yes  LDA H%+10
 1010       CLC:ADC #4
 1020       STA H%+10
 1030       TAY
 1040       LDX #0
 1050 .T4   LDA H%+4,X
 1060       STA H%,Y
 1070       INY:INX
 1080       CPX #4
 1090       BNE T4
 1100 .NO   RTS
 1110 .pop  LDY H%+10
 1120       LDX #0
 1130 .T1   LDA H%,Y
 1140       STA H%,X
 1150       INY:INX
 1160       CPX #4
 1170       BNE T1
 1180       LDA H%+10
 1190       SEC:SBC #4
 1200       STA H%+10
 1210       RTS
 1220 .plot LDA H%+0:JSR OSWRCH
 1230       LDA H%+1:JSR OSWRCH
 1240       LDA H%+2:JSR OSWRCH
 1250       LDA H%+3:JSR OSWRCH
 1260       RTS
 1270 .pix  LDY #0
 1280 .T2   LDA H%,Y
 1290       STA H%+4,Y
 1300       INY
 1310       CPY #4
 1320       BNE T2
 1330       RTS
 1340 .pnt  LDX #((H%+4) MOD 256)
 1350       LDY #((H%+4) DIV 256)
 1360       LDA #9
 1370       JSR OSWORD
 1380       LDA H%+8
 1390       RTS
 1400 .sub  LDA H%,Y
 1410       SEC:SBC #4
 1420       STA H%,Y
 1430       BCS out
 1440       LDA H%+1,Y:TAX:DEX:TXA
 1450       STA H%+1,Y
 1460 .out  RTS
 1470 .add  LDA H%,Y
 1480       CLC:ADC #4
 1490       STA H%,Y
 1500       LDA H%+1,Y
 1510       ADC #0
 1520       STA H%+1,Y
 1530       RTS
 1540]
 1550 NEXT PASS
 1560 ENDPROC
