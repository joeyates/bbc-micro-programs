   10 N=30
   20 DIM ARRAY(N)
   30 FOR I=1 TO N
   40 ARRAY(I)=INT(RND(1)*30+1)
   50 NEXT I
   55 T=TIME
   60 PROCQUICKSORT(1,N)
   65 PRINT (TIME-T)/100
   70 END
  100 DEF PROCQUICKSORT(LOW,UP)
  110 K=LOW:J=UP
  120 X=ARRAY(INT((LOW+UP)/2))
  130 IF K>J THEN 230
  140 IF ARRAY(K)<X THEN K=K+1:GOTO 140
  150 IF X<ARRAY(J) THEN J=J-1:GOTO 150
  160 IF K>J THEN 230
  170 Y=ARRAY(K)
  180 ARRAY(K)=ARRAY(J)
  190 ARRAY(J)=Y
  200 K=K+1
  210 J=J-1
  220 GOTO 130
  230 IF LOW<J THEN PROCQUICKSORT(LOW,J)
  240 IF K<UP THEN PROCQUICKSORT(K,UP)
  250 ENDPROC