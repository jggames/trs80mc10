 10 PAGE
 20  INPUT "ANZAHL DER MASSEN=";K
 30  IF K=0 THEN   FOR 
 35  DIM DS(K),E(K),F(K+1),C(K+1),M(K),L(K),X(K+1)
 40  PRINT : PRINT : PRINT "FEDERK.  LAENGE(cm) MASSE"
 50  FOR R=0 TO K
 60  PRINT "(";R;")";: INPUT  C(R),L(R),M(R)
 70 L(R)=L(R)/100: NEXT 
 75  INPUT "ENERGIEVERLUST (0-100)";DA:DA=DA/1E9
 80  INPUT "WELLENANZAHL (0-#)";WA
 85  INPUT "AMPLITUDE 1-50 (cm) ";A:A=A/100
 90  INPUT "FREQENZ,DEL.T 1-500 ";F,D 
 95  FOR R=1 TO K:X(R)=X(R-1)+L(R-1): NEXT 
 96 S=X(K)/31:PAGE: FOR R=0 TO K
 97  POKE 54016+X(R)/S,48+R: NEXT 
 100 Z=1/F:DT=Z/D:CT=6.2832/D
 110  FOR T=Q TO WA*6.2832 STEP CT:DS(0)=A*( SIN (T)-SI):SI= SIN (T) 
 120 X(0)=X(0)+DS(0):F(1)=C(0)*(X(1)-X(0)-L(0))
 125  FOR R=1 TO K:F(R+1)=C(R)*(X(R+1)-X(R)-L(R)):F(R)=F(R)-F(R+1)
 130 B=( ABS (DS(R-1))+ ABS (DS(R))) ^ 2*DA:L= SGN (E(R))*B/DT/DT
 140 E(R)=E(R)+ SGN (F(R))*F(R)*F(R)/2/M(R)*DT*DT-L/2/M(R)
 150 DS(R)= SGN (E(R))* SQR ( ABS (2*E(R)/M(R))):X(R)=X(R)-DS(R): NEXT 
 160  PRINT : FOR R=0 TO K: IF  ABS (X(R)/S)>32 THEN  NEXT : NEXT : GOTO 170
 166  POKE 54016+X(R)/S,48+R: NEXT : NEXT           
 170 Q=T-CT:SI= SIN (Q): GOTO 110
 19201 
