
   10DIM data% 4097,ID% 200,bl% 20
   20X%=bl% MOD 256:Y%=bl% DIV 256
   30MODE7:A%=&7F:osw%=&FFF1:?bl%=0
   40REM SEEK TRACK 0 DISC 0
   50PROCOSW(0,0,1,&69,0,0,0,0,0)
   60IF bl%?8<>0 THEN END
   70REM SEEK TRACK 0 DISC 1
   80PROCOSW(1,0,1,&69,0,0,0,0,0)
   90IF bl%?8<>0 THEN END
  100SKIP=FALSE:FOR tr%=0 TO 79
  110PRINT"Track ";tr%
  120REM   READ SECTOR IDS
  130PROCOSW(0,ID%,3,&5B,tr%,0,18,0,0)
  140SKIP=FALSE
  150IF bl%?10<>0 SKIP=TRUE:GOTO 360
  160PROCHOWMANY
  170REM   PROGRAM 8271 FOR SOFT TRACK
  180PROCOSW(0,0,2,&3A,&12,?ID%,0,0,0)
  190PROCLOW
  230REM   READ TRACK
  240PROCOSW(0,data%,3,&57,?ID%,low%,32*ID%?3+NUM%+1,0,0)
  250REM REPROGRAM 8271
  260PROCOSW(0,0,2,&3A,&12,tr%,0,0,0)
  270del%=bl%?10 AND &20:err%=bl%?10 AND &1F
  280IF err%<>0 THEN PRINT"###";err%
  290REM   FORMAT TRACK
  300PROCOSW(1,ID%,5,&63,tr%,21,32*ID%?3+NUM%+1,0,16)
  310REM   PROGRAM 8271 FOR SOFT TRACK
  320PROCOSW(1,0,2,&3A,&1A,?ID%,0,0,0)
  330REM   WRITE DATA
  340IFdel%=0 wr%=&4B ELSE wr%=&4F
  350PROCOSW(1,data%,3,wr%,?ID%,low%,32*ID%?3+NUM%+1,0,0)
  352REM   REPROGRAM 8271
  353PROCOSW(1,0,2,&3A,&1A,tr%,0,0,0)
  360NEXT tr%:END
  370DEFPROCOSW(side%,addr%,par%,comm%,P1%,P2%,P3%,P4%,P5%)
  380bl%?0=side%:bl%!1=addr%
  390bl%?5=par%:bl%?6=comm%
  400bl%?7=P1%:bl%?8=P2%:bl%?9=P3%
  410bl%?10=P4%:bl%?11=P5%
  420CALLosw%
  430ENDPROC
  440DEF PROCHOWMANY
  450NUM%=0:FIRST%=ID%?2
  460IFID%?(6+4*NUM%)<>FIRST% NUM%=NUM%+1:GOTO 460 ELSE ENDPROC
  470REM SECTORS AREN'T GOING ON IN RIGHT ORDER
  475DEF PROCLOW
  480low%=&FF
  490FOR I=0 TO NUM%
  500IF ID%?(I*4+2)<low% low%=ID%?(I*4+2)
  510NEXTI
  520ENDPROC

