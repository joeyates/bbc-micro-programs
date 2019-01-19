   10REM DISC FORMATTING PROGRAM
   20DIM data% 512,bl% 20
   30X%=bl% MOD 256:Y%=bl% DIV 256
   40MODE7:A%=&7F:osw%=&FFF1
   50CLS:INPUT"Side :"S%
   60REM   SEEK TRACK 0
   70PROCOSW(1,&69,0,0,0,0,0)
   80FOR tr%=0 TO 79
   90CLS:PRINT"Track ";tr%
  100REM   FORMAT TRACK
  110PROCids
  120PROCOSW(5,&63,tr%,21,42,0,16)
  130IFtr%=0 PROCdir
  140NEXT tr%:END
  150 
  160DEF PROCdir
  170FORI%=data% TO data%+252 STEP 4
  180!I%=&20202020
  190NEXT I%
  200PROCOSW(3,&4B,tr%,0,33,0,0)
  210data%!4=&20030000
  230PROCOSW(3,&4B,tr%,1,33,0,0)
  240ENDPROC
  250 
  260DEF PROCids
  270FOR I%=0 TO 36 STEP 4
  280data%?I%=tr%:data%?(I%+1)=0
  300data%?(I%+2)=(I%/4+1+(tr%*7))MOD 10
  310data%?(I%+3)=1
  320NEXT I%
  330ENDPROC
  340 
  350DEFPROCOSW(par%,comm%,P1%,P2%,P3%,P4%,P5%)
  360bl%?0=S%:bl%!1=data%
  370bl%?5=par%:bl%?6=comm%
  380bl%?7=P1%:bl%?8=P2%:bl%?9=P3%
  390bl%?10=P4%:bl%?11=P5%
  400CALLosw%
  410ENDPROC
