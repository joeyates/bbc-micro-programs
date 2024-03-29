   10 INPUT "NUMBER OF BELLS:",NUM
   20 PROCSETUP
   30 FOR CHG=1 TO (2*NUM+1)
   35 FOR I=1 TO 200:NEXT I
   40 PROCRING
   50 PROCG
   60 PROCCHANGE((CHG+1) MOD 2)
   70 NEXT CHG
   80 END
   90 DEF PROCSETUP
   95 DIM T(NUM)
  100 FOR N=1 TO NUM
  110 READ T(N)
  120 NEXT N
  130 DATA 101,97,89,81,73
  140 CLS
  150 DIM BELL(NUM),S(NUM),CH(NUM,2)
  160 FOR N=2 TO NUM STEP 2
  170 BELL(N)=N:BELL(N+1)=N+1
  180 BELL(1)=1
  190 CH(N,0)=-1:CH(N-1,0)=1
  200 CH(N,1)=1:CH(N+1,1)=-1
  210 NEXT N
  220 CH(NUM,0)=0
  230 CH(1,1)=0
  240 ENDPROC
  250 DEFPROCRING
  260 FOR N=1 TO NUM
  270 PRINTTAB(N,3+CHG);BELL(N)
  280 SOUND 1,-15,T(BELL(N)),15
  285 FOR I=1 TO 1000
  286 NEXT I
  290 NEXT N
  300 ENDPROC
  310 DEF PROCCHANGE(L)
  320 FOR N=1 TO NUM
  330 BELL(N)=S(N+CH(N,L))
  340 NEXT N
  350 ENDPROC
  360 DEF PROCG
  370 FOR N=1 TO NUM
  380 S(N)=BELL(N)
  390 NEXT N
  400 ENDPROC
