    5n=3
   10DIM P$(2),TEMP$(8),VERB$(n),FM$(6,8)
   12P$(1)="singuliere":P$(2)="pluriel"
   13FOR I=1 TO 8:READ TEMP$(I):NEXT I
   14FOR I=1 TO n:READ VERB$(I):NEXT I
   16CLS:PRINT'''
   18FOR I=1 TO n:PRINT I;" :";VERB$(I):NEXT I
   19INPUT"Immettez le numero :"R
   20IF R<1 OR R>n THEN 19
   21ON R GOTO 22,23,24
   22RESTORE 1000:GOTO 28
   23RESTORE 1100:GOTO 28
   24RESTORE 1200:GOTO 28
   28FOR I=1 TO 8:FOR J=1 TO 6
   30READ FM$(J,I)
   40NEXT J,I
   50X=RND(8):Y=RND(6)
   60PRINT TEMP$(X);" ";((Y-1) MOD 3+1);"e personne ";P$((Y-1) DIV 3+1)
   70INPUT R$
   75IF R$="" THEN 16
   77IF R$="-" PRINT"N'existe pas!":GOTO 90
   80IF R$=FM$(Y,X) PRINT"oui, bravo!" ELSE PRINT "Non, c'est ";FM$(Y,X)
   90GOTO 50
  900DATA imperatif,present,sujonctif present,subjonctif imparfait,imparfait,conditionel,futur,passe simple
  950DATA Etre,Avoir,Aimer
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
