create table CLIENT(NUMCLIENT decimal not null,
					NOM char (16) not null,
					ADRESSE char (80) not null,
				primary key (NUMCLIENT));
				
create table CONTRAT(SIGNATAIRE decimal (12) not null,
					 NUMCTR rowid (12) not null,
					 TYPE char (16) not null,
					 DATESIGN date (8) not null,
				primary key (SIGNATAIRE,NUMCTR),
				foreign key (SIGNATAIRE) references CLIENT
				on delete no action on update cascade);
				
create table VEHICULE(NUMVEH char (7) not null,
					  MARQUE char (12) not null,
					  MODELE char (12) not null,
					  ANNEE date (4) not null,
					  CYLINDREE decimal (4) not null,
					  SIGNATAIRE decimal (12) not null,
					  NUMCTR decimal (12) not null,
					  NUMCLIENT decimal (12) not null,
				primary key (NUMVEH),
				unique (SIGNATAIRE,NUMCTR),
				foreign key (NUMCLIENT) references CLIENT
				on delete no action on update cascade);
				
create table ACCIDENT(NUMACC rowid (12) not null,
					  DATEACC date (8) not null,
					  MONTANT decimal (1) not null default 0,
				primary key (NUMACC));
				
create table IMPLICATION(NUMACC decimal (12) not null,
						 NUMVEH char (7) not null,
					primary key (NUMACC,NUMVEH),
					foreign key (NUMVEH) references VEHICULE
					on delete no action on update cascade,
					foreign key (NUMACC) references ACCIDENT
					on delete no action on update cascade);
					

create index XCLI_NUMCLI on CLIENT(NUMCLIENT);
create index XCTR_NUMCTR on CONTRAT(NUMCTR);
create index XVEH_NUMVEH on VEHICULE(NUMVEH);
create index XACC_NUMACC on ACCIDENT(NUMACC);
create index XIMP_NUMIMP on IMPLICATION(NUMACC,NUMVEH);