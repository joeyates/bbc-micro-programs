   10N=27:REAL=1:IMAG=2
   20DIM ZI(N,2),ZO(N,2)
   30DIM OME(2),ARG(2),VAL(2)
  110ANG=2*PI/(NOW*AFT)
  120OME(R)=COS(ANG):OME(I)=-SIN(ANG)
  140ARG(R)=COS(ANG):OME(I)=-SIN(ANG)
  160FOR J=1 TO NOW
  170FOR IA=1 TO AFT
  180FOR IB=1 TO BEF
  190VAL(R)=ZI(IA,IB,NOW,R) 
  200VAL(I)=ZI(IA,IB,NOW,I)
  210FOR K=NOW-1 TO 1 STEP -1
  220VAL(R)=VAL(R)*ARG(R)+VAL(I)*ARG(I)+ZI(IA,IB,K,R)
  230VAL(I)=VAL(I)*ARG(R)+VAL(R)*ARG(I)+ZI(IA,IB,K,I)
  240NEXT K
  250ZO(IA,J,IB,R)=VAL(R)
  260ZO(IA,J,IB,I)=VAL(I)
  270NEXT IB
  280ARG(1)=ARG(1)*OME(1)+ARG(2)*OME(2)
  290ARG(2)=ARG(2)*OME(1)+ARG(1)*OME(2)
  300NEXT IA,J