    5n=4
   10DIM PRON$(6),TEMP$(8),VERB$(n),FM$(6,8),SC(n,2,1)
   12FOR I=1 TO 6:READ PRON$(I):NEXT I
   13FOR I=1 TO 8:READ TEMP$(I):NEXT I
   14FOR I=1 TO n:READ VERB$(I):NEXT I
   16CLS:PRINT'''"Verbe"TAB(20);"Resultat"'
   18FOR I=1 TO n:PRINT ;I;": ";VERB$(I);TAB(20);SC(I,1,1);"/";SC(I,2,1):NEXT I
   19INPUT'"Immettez le numero :"R
   20IF R<1 OR R>n THEN 19
   22RESTORE (900+R*100)
   25CLS:PRINT''VERB$(R)''
   28FOR I=1 TO 8:FOR J=1 TO 6
   30READ FM$(J,I)
   40NEXT J,I
   50X=RND(8):Y=RND(6)
   60PRINT TEMP$(X);": ";PRON$(Y);
   70INPUT " "R$
   75IF R$="" THEN 16
   77IF FM$(Y,X)="-" PRINT"N'existe pas!":GOTO 50
   80IF R$=FM$(Y,X) PRINT"oui, bravo!":SC(R,1,1)=SC(R,1,1)+1 ELSE PRINT "Non, c'est ";FM$(Y,X)
   90SC(R,2,1)=SC(R,2,1)+1:GOTO 50
  890DATA Je,Tu,Il,Nous,Vous,Ils
  900DATA Imperatif,Present,Sujonctif present,Subjonctif imparfait,Imparfait,Conditionel,Futur,Passe simple
  950DATA Etre,Avoir,Aimer,Finir
 1000DATA -,sois,-,soyons,soyez,-
 1010DATA suis,es,est,sommes,etes,sont
 1020DATA sois,sois,soit,soyons,soyez,soient
 1030DATA fusse,fusses,fut,fussions,fussiez,fussent
 1040DATA etais,etais,etait,etions,etiez,etaient
 1050DATA serais,serais,serait,serions,seriez,seraient
 1060DATA serai,seras,sera,serons,serez,seront
 1070DATA fus,fus,fut,fumes,futes,furent
 1100DATA -,aie,-,ayons,ayez,-
 1110DATA ai,as,a,avons,avez,ont
 1120DATA aie,aies,ait,ayons,ayez,aient
 1130DATA eusse,eusses,eut,eussions,eussiez,eussent
 1140DATA avais,avais,avait,avions,aviez,avaient
 1150DATA aurais,aurais,aurait,aurions,auriez,auraient
 1160DATA aurai,auras,aura,aurons,aurez,auront
 1170DATA eus,eus,eut,eumes,eutes,eurent
 1200DATA -,aime,-,aimons,aimez,-
 1210DATA aime,aimes,aime,aimons,aimez,aiment
 1220DATA aime,aimes,aime,aimions,aimiez,aiment
 1230DATA aimasse,aimasses,aimat,aimassions,aimassiez,aimassent
 1240DATA aimais,aimais,aimait,aimions,aimiez,aimaient
 1250DATA aimerais,aimerais,aimerait,aimerions,aimeriez,aimeraient
 1260DATA aimerai,aimeras,aimera,aimerons,aimerez,aimeront
 1270DATA aimai,aimas,aima,aimames,aimates,aimerent
 1300DATA -,finis,-,finissons,finissez,-
 1310DATA finis,finis,finit,finissons,finissez,finissent
 1320DATA finisse,finisses,finisse,finissions,finissiez,finissent
 1330DATA finisse,finisses,finit,finissions,finissiez,finissent
 1340DATA finissais,finissais,finissait,finissions,finissiez,finissaient
 1350DATA finirais,finirais,finirait,finirions,finiriez,finiraient
 1360DATA finirai,finiras,finira,finirons,finirez,finiront
 1370DATA finis,finis,finit,finimes,finites,finirent
