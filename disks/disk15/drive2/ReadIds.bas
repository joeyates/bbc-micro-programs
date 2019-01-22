>LIST
   40MODE7:VDU23;8202;0;0;0;
   50max%=80
   60 osword%=&FFF1
   70 IDbuff%=&FFFF0C20
   80oswblock%=&FFFF0C00
  130?oswblock%=0
  140!(oswblock%+1)=&FFFFFFFF
  150oswblock%?5=1
  160oswblock%?6=&69
  170oswblock%?7=0
  180A%=&7F
  190X%=oswblock% MOD 256
  200Y%=oswblock% DIV 256
  210 CALLosword%
  220IF oswblock%?8<>0 THEN END
  280?oswblock%=0
  300 !(oswblock%+1)=IDbuff%
  340oswblock%?5=3
  360oswblock%?6=&5B
  400oswblock%?7=0
  410oswblock%?8=0
  420oswblock%?9=18
  490 FOR track%=0 TO max%-1
  520oswblock%?7=track%
  530CLS
  550CALLosword%
  570PRINT"Track ";track%
  580IF oswblock%?10<>0 THEN PRINT"DISC ERROR ":GOTO 660
  590PRINT" Track(C) Header(H) Sector(R) Size(N)"
  600FOR ids=0 TO (17*4) STEP 4
  610FOR ids2=0 TO 3
  620PRINT;SPC(7);?(ids2+IDbuff%+ids);
  630NEXT ids2
  640PRINT
  650NEXT ids
  660PRINT'TAB(7)"Press SPACE to continue"
  670*FX 15
  680REPEAT UNTIL GET=32
  690NEXT track%
  700PRINT"All IDs read"
>*FX3,0
