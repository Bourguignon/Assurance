insert into CLIENT
values (0,"Bidoche","26 rue de la tarte");

insert into CLIENT
values ((select max(NUMCLIENT)+1 from CLIENT)
		 ,"Bridou"
		 ,"35 impasse du cochon");
		 
insert into CLIENT
values ((select max(NUMCLIENT)+1 from CLIENT)
	   ,"Anis"
	   ,"51 avenue du pastis");
	   
insert into CONTRAT
values ((select NUMCLIENT 
		 from CLIENT 
		 where NUMCLIENT=2),
		 0,
		 "Automobile",
		 "2017-05-25");
		 
insert into CONTRAT
values ((select NUMCLIENT 
		 from CLIENT 
		 where NUMCLIENT=0),
		 (select max(NUMCTR)+1 from CONTRAT),
		 "Automobile",
		 "2017-05-15");
		 
insert into VEHICULE
values("HJ-555-KK",
	   "Renault",
	   "R19",
	   "1985",
	   "2000",
	   (select NUMCLIENT 
	   from CLIENT 
	   where NUMCLIENT=2),
	   (select NUMCTR 
	   from CONTRAT,CLIENT
	   where NUMCLIENT=SIGNATAIRE),
	   (select NUMCLIENT 
	   from CLIENT
	   where NUMCLIENT=1));
	   
insert into ACCIDENT
values(0,"2017-07-20",0);

insert into IMPLICATION
values((select NUMACC from ACCIDENT
	    where NUMACC=0),
		(select NUMVEH from VEHICULE
		where NUMVEH="HJ-555-KK"));