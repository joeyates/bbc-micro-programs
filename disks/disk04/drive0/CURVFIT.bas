  100 INPUT "HIGHEST DEGREE OF POLY :",D
  120 INPUT "NO OF PTS",N
  140 DIM A(N,N),B(N),C(N),X(N),Y(N),E(N),S(N)
  150 FOR I=1 TO N
  160 PRINT "POINT ";I;" :";
  170 INPUT X(I),Y(I)
  180 NEXT I
  190 FOR D=D TO 1 STEP -1:Y1=0
  200 FOR J=1 TO N:FOR I=1 TO D
  210 B(I)=B(I)+Y(J)*X(J)^I
  220 FOR K=1 TO D
  230 A(I,K)=A(I,K)+X(J)^(I+K)
  250 S(I)=S(I)+X(J)^I
  260 NEXT I
  270 Y1=Y1+Y(J)
  280 NEXT J
  290 FOR I=1 TO D:FOR J=1 TO D
  300 A(I,J)=A(I,J)-S(I)*S(J)/N
  310 NEXT J
  320 B(I)=B(I)-Y1*S(I)/N
  330 NEXT I
  340 FOR K=1 TO D
  350 R=K:A1=0
  360 FOR L=K TO D
  370 A2=ABS(A(L,K))
  380 IF A2>A1 THEN A1=A2:R=L
  390 NEXT L
  400 IF A1=0 THEN PRINT"ZERO IN A MAT":END
  410 IF R=K THEN 460
  420 FOR J=K TO D
  430 X1=A(R,J):A(R,J)=A(K,J):A(K,J)=X1
  440 NEXT J
  450 X1=B(R):B(R)=B(K):B(K)=X1
  460 FOR I=K TO D
  470 M=A(I,K)
  480 FOR J=K TO D
  490 IF I=K THEN A(I,J)=A(I,J)/M
  500 IF I<>K THEN A(I,J)=A(I,J)-M*A(K,J)
  510 NEXT J
  520 IF I=K THEN B(I)=B(I)/M
  530 IF I<>K THEN B(I)=B(I)-M*B(K)
  540 NEXT I,K
  550 E(D)=B(D)
  560 FOR K=1 TO D-1
  570 I=D-K:S1=0
  580 FOR J=1 TO D
  590 S1=S1+A(I,J)*E(J)
  600 NEXT J
  610 E(I)=B(I)-S1
  620 NEXT K
  630 PRINT "COEFFS ARE"
  640 S1=0:FOR I=1 TO D
  650 S1=S1+E(I)*S(I)/N
  660 NEXT I
  670 PRINT "A0=";Y1/N-S1
  680 FOR P=1 TO D
  690 PRINT"A";P;" = ";E(P)
  700 NEXT P