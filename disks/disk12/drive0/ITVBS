    5 N=7
   10 DIM VB$(30),PRON$(6),PASS$(6)
   15 FOR I=1 TO 6:READ PRON$(I):NEXT
   50 FOR I=1 TO N:READ VB$(I):NEXT
   70 X=RND(6):Y=RND(N)
   80 PRINT VB$(Y);": ";PRON$(X);
   85 RESTORE (990+Y*10)
   86 FOR I=1 TO X:READ PASS$(I):NEXT
   90 INPUT " "R$
  100 IF R$=PASS$(X) THEN 120
  110 PRINT "No, e ";PRON$(X);" ";PASS$(X)
  120 GOTO 70
  850 DATA Io,Tu,Egli,Noi,Voi,Essi
  900 DATA Amare,Andare,Avere,Essere,Finire,Vivere,Volere
 1000 DATA amai,amasti,amo,amammo,amaste,amarono
 1010 DATA andai,andasti,ando,andammo,andaste,andarono 
 1020 DATA ebbi,avesti,ebbe,avemmo,aveste,ebbero
 1030 DATA fui,fosti,fu,fummo,foste,furono 
 1040 DATA finii,finisti,fini,finimmo,finiste,finirono
 1050 DATA vissi,vivesti,visse,vivemmo,viveste,vissero
 1060 DATA volli,volesti,volle,volemmo,voleste,vollero
