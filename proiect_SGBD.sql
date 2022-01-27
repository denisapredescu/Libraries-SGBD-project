--4.

CREATE TABLE CATEGORII 
(cod_categorie number(5) constraint pkey_categorie primary key,
gen varchar2(25) constraint gen not null
);

CREATE TABLE SERII 
(cod_serie number(5) constraint pkey_serie primary key,
nume varchar2(25) NOT NULL
);

CREATE TABLE CARTI 
(cod_carte number(5) constraint pkey_carte primary key,
denumire varchar2(100) constraint denumire_carte not null,
numar_pagini number(5),
pret number(5,2),
an_aparitie number(4),
numar_volum number(2) default null,
cod_serie number(5)constraint fkey_carte_serie references serii (cod_serie)
);

CREATE TABLE SCRIITORI 
(cod_scriitor number(5) constraint pkey_scriitor primary key,
nume varchar2(25),
prenume varchar2(25),
nationalitate varchar2(12),
sex char(1),
data_nastere date default null,
data_deces date default null
);


CREATE TABLE ORASE 
(cod_oras number(5)  constraint pkey_oras primary key,
denumire varchar2(25) not null,
judet varchar2(25),
cod_postal char(6)
);

CREATE TABLE LOCATII 
(cod_locatie number(5),
cod_oras number(5) constraint fk_locatie_oras references orase (cod_oras),
    constraint pk_compus primary key(cod_locatie, cod_oras),
strada varchar2(50) not null,
numar number(4)
);

CREATE TABLE LIBRARII 
(cod_librarie number(5) constraint pk_librarie primary key,
data_infiintare date default sysdate,
denumire varchar2(25) not null,
cod_locatie number(5),
cod_oras number(5),
constraint fk_compus foreign key(cod_locatie, cod_oras) references locatii (cod_locatie, cod_oras) 
);

CREATE TABLE ANGAJATI 
(cod_angajat number(5) constraint pkey_angajat primary key,
nume varchar2(25) not null,
prenume varchar2(25),
salariu number(4),
telefon char(10),
sex char(1),
tip_angajat varchar2(25) not null,
cod_librarie number(5) constraint fkey_ang_librarie references librarii (cod_librarie)
);


CREATE TABLE BONURI 
(cod_bon number(5) constraint pk_bon primary key,
data_bon date default sysdate,
cod_carte number(5) constraint fk_bon_carte references carti(cod_carte),
cod_angajat number(5) constraint fk_bon_ang references angajati (cod_angajat)
);

CREATE TABLE ARE 
(cod_scriitor number(5), 
cod_carte number(5),
cod_categorie number(5),
constraint fk_are_scriitor foreign key(cod_scriitor) references scriitori (cod_scriitor),
constraint fk_are_carte foreign key(cod_carte) references carti (cod_carte),
constraint fk_are_categorie foreign key(cod_categorie) references categorii (cod_categorie),
constraint pk_compus_are primary key(cod_scriitor, cod_carte, cod_categorie)
);

CREATE TABLE STOC 
(cod_carte number(5),
cod_librarie number(5),
nr_exemplare number(2),
constraint fk_stoc_carte foreign key(cod_carte) references carti (cod_carte),
constraint fk_stoc_librarie foreign key(cod_librarie) references librarii (cod_librarie),
constraint pk_compus_stoc primary key(cod_carte, cod_librarie)
);


--5.INSERARI
CREATE SEQUENCE SEQ_S
INCREMENT by 1
START WITH 100
MAXVALUE 10000
NOCYCLE;

--SCRIITORI
insert into  scriitori  
values (SEQ_S.NEXTVAL, 'Oke', 'Janette', 'Canadiana', 'f', to_date('18-02-1935','dd-mm-yyyy'), null);

insert into  scriitori  
values (SEQ_S.NEXTVAL, 'Dickens', 'Charles', 'Britanica', 'm', to_date('07-02-1812','dd-mm-yyyy'), to_date('09-06-1870','dd-mm-yyyy'));

insert into  scriitori  
values (SEQ_S.NEXTVAL, 'Witemeyer', 'Karen', 'Americana', 'f', null, null);

insert into  scriitori  
values (SEQ_S.NEXTVAL, 'Drumes', 'Mihail', 'Romana', 'm', to_date('26-11-1901','dd-mm-yyyy'), to_date('07-02-1982','dd-mm-yyyy'));

insert into  scriitori  
values (SEQ_S.NEXTVAL, 'Bunn', 'T. Davis', 'Americana', 'm',to_date('01-01-1952','dd-mm-yyyy'), null);

insert into  scriitori  
values (SEQ_S.NEXTVAL, 'Rowling', 'J.K.', 'Britanica', 'f',to_date('31-07-1965','dd-mm-yyyy'), null);

insert into  scriitori  
values (SEQ_S.NEXTVAL, 'Dumas', 'Alexandre', 'Franceza', 'm',to_date('24-07-1802','dd-mm-yyyy'), to_date('05-12-1870','dd-mm-yyyy'));
commit;
select* from scriitori ;

--serii
CREATE SEQUENCE SEQ_SERII
INCREMENT by 10
START WITH 300
MAXVALUE 10000
NOCYCLE;

insert into serii  
values(SEQ_SERII.NEXTVAL,'Anotimpurile inimii');
insert into serii  
values(SEQ_SERII.NEXTVAL,'Cantecul Acadiei');
insert into serii  
values(SEQ_SERII.NEXTVAL,'Faptele credintei');
insert into serii  
values(SEQ_SERII.NEXTVAL, 'Harry Potter');
insert into serii  
values(SEQ_SERII.NEXTVAL, 'Cei trei muschetari');
commit;
select* from serii  ;



--carti

CREATE SEQUENCE SEQ_CARTI
INCREMENT by 1
START WITH 100
MAXVALUE 10000
NOCYCLE;

insert into carti  
values(SEQ_CARTI.NEXTVAL, 'Invitatia la vals',336, 30.60, 1936, null, null);  

insert into carti  
values(SEQ_CARTI.NEXTVAL, 'Cu capul in nori',315, 31, 2010, null, null);     

insert into carti  
values(SEQ_CARTI.NEXTVAL, 'Mireasa pe masura',295, 28.50, 2010, null, null); 

insert into carti  
values(SEQ_CARTI.NEXTVAL, 'Marile sperante',544, 30, 1861, null, null);

insert into carti  
values(SEQ_CARTI.NEXTVAL, 'Mostenirea', 294 , 27, 2001, 3, 310);  --seria Cantecul Acadiei -oke si bunn
insert into carti  
values(SEQ_CARTI.NEXTVAL, 'Binecuvantatul tarm',286, 28.5 , 1936, 2, 310); 
insert into carti  
values(SEQ_CARTI.NEXTVAL, 'Locul de intalnire',318, 27, 1999, 1, 310); 
insert into carti  
values(SEQ_CARTI.NEXTVAL, 'Limanul mult dorit',324, 27, 2000, 5 , 310); 
insert into carti  
values(SEQ_CARTI.NEXTVAL, 'Un far calauzitor',256, 27, 2002, 4, 310); 

insert into carti  
values(SEQ_CARTI.NEXTVAL, 'A fost odata intr-o vara',224, 21.85, 1981, 1, 300);     --scrise de Oke
insert into carti  
values(SEQ_CARTI.NEXTVAL, 'Promisiunea unei noi primaveri',222, 21.85, 1989, 4, 300); 
insert into carti  
values(SEQ_CARTI.NEXTVAL, 'Vanturi tomnatice',220, 21.85, 1987, 2, 300); 
insert into carti  
values(SEQ_CARTI.NEXTVAL, 'Iarna nu tine o vesnicie',216, 21.85, 1988, 3, 300); 

insert into carti  
values(SEQ_CARTI.NEXTVAL, 'Sotia Centurionului',321, 35, 2010, 1, 320);    --Bunn si Oke
insert into carti  
values(SEQ_CARTI.NEXTVAL, 'Flacara ascunsa',388, 35, 2011, 2, 320); 
insert into carti  
values(SEQ_CARTI.NEXTVAL, 'Drumul spre Damasc',432, 35, 2011, 3, 320); 

insert into carti  
values(SEQ_CARTI.NEXTVAL, 'Harry Potter si camera secretelor',400, 48.48, 1998, 2, 330); 
insert into carti  
values(SEQ_CARTI.NEXTVAL, 'Harry Potter si pocalul de foc',728, 58, 2000, 4, 330);
insert into carti  
values(SEQ_CARTI.NEXTVAL, 'Harry Potter si printul semisange', 650, 64.64, 2005, 6, 330);
insert into carti  
values(SEQ_CARTI.NEXTVAL, 'Harry Potter si talismanele mortii',784, 64.64, 2007, 7, 330);
insert into carti  
values(SEQ_CARTI.NEXTVAL, 'Harry Potter si ordinul phoenix',990, 64.64, 2003, 5, 330);
insert into carti  
values(SEQ_CARTI.NEXTVAL, 'Harry Potter si piatra filosofala',532, 42, 1997, 1, 330);
insert into carti  
values(SEQ_CARTI.NEXTVAL, 'Harry Potter si prizonierul din Azkaban',464, 48.48, 1999, 3, 330);


insert into carti  
values(SEQ_CARTI.NEXTVAL, 'Cei trei muschetari',224, 21, 1844, 1, 340);
insert into carti  
values(SEQ_CARTI.NEXTVAL, 'Dupa 20 de ani',622, 33, 1845, 2, 340);

select* from carti  ;

--categorii
CREATE SEQUENCE SEQ_CATEG
INCREMENT by 1
START WITH 10
MAXVALUE 10000
NOCYCLE;

insert into categorii   values(SEQ_CATEG.NEXTVAL,'romantic');
insert into categorii   values(SEQ_CATEG.NEXTVAL,'fictiune');
insert into categorii   values(SEQ_CATEG.NEXTVAL,'istoric');
insert into categorii   values(SEQ_CATEG.NEXTVAL,'de familie');
insert into categorii   values(SEQ_CATEG.NEXTVAL,'crestin');
insert into categorii   values(SEQ_CATEG.NEXTVAL,'dezvoltare personala');
insert into categorii   values(SEQ_CATEG.NEXTVAL,'psihologic');
insert into categorii   values(SEQ_CATEG.NEXTVAL,'fantastic');
insert into categorii   values(SEQ_CATEG.NEXTVAL,'drama');
insert into categorii   values(SEQ_CATEG.NEXTVAL,'mister');
insert into categorii   values(SEQ_CATEG.NEXTVAL,'aventura');
insert into categorii   values(SEQ_CATEG.NEXTVAL,'bildungsroman');
commit;
select * from categorii;

--Janette Oke 100 si Bunn - 104  --seria cantecul Acadiei
--carti 104 - 108
--gen : fictiune-11, crestin-14
insert into are   values(100,104,11); 
insert into are   values(100,105,11);  
insert into are   values(100,106,11);  
insert into are   values(100,107,11);
insert into are   values(100,108,11);

insert into are   values(100,104,14); 
insert into are   values(100,105,14);
insert into are   values(100,106,14);  
insert into are   values(100,107,14);
insert into are   values(100,108,14);

insert into are   values(104,104,11); 
insert into are   values(104,105,11); 
insert into are   values(104,106,11);  
insert into are   values(104,107,11);
insert into are   values(104,108,11);

insert into are   values(104,104,14); 
insert into are   values(104,105,14);  
insert into are   values(104,106,14);  
insert into are   values(104,107,14);
insert into are   values(104,108,14);


--Seria Anotimpurile inimii(cartile 109,110,111,112) 
insert into are   values(100,109,14);     --crestin-14
insert into are   values(100,110,14);     
insert into are   values(100,111,14);
insert into are   values(100,112,14);

insert into are   values(100,109,10);     --romantic-10
insert into are   values(100,110,10);     
insert into are   values(100,111,10);
insert into are   values(100,112,10);

--102 -karen Witemeyer 
--romane 101, 102
insert into are   values(102,101,10);    --romantic 10
insert into are   values(102,102,10);     

insert into are   values(102,101,11);    --fictiune  11
insert into are   values(102,102,11);

insert into are   values(102,101,14);    --crestin 14
insert into are   values(102,102,14);


--Oke(100) si Bun(104)--seria Faptele credintei(320)(cartile:113, 114, 115)  
--istoric-12, crestin-14
insert into are   values(100, 113,12);   
insert into are   values(100, 114, 12);
insert into are   values(100, 115,12);
insert into are   values(100, 113,14);   
insert into are   values(100, 114,14);
insert into are   values(100, 115,14);

insert into are   values(104, 113,12);  
insert into are   values(104, 114, 12);
insert into are   values(104, 115, 12);
insert into are   values(104, 113,14);
insert into are   values(104, 114,14);
insert into are   values(104, 115,14);
commit;

select * from carti  ;

--drumes-103 - carti invitatie la vals 100 - 10 -16
insert into are   values(103,100,10);   
insert into are   values(103,100,16);

--Harry potter - 116-....-122  --autoare-105- fictiune 11,  fantastic 17, mister 19
insert into are   values(105,116,11);
insert into are   values(105,117,11);
insert into are   values(105,118,11);
insert into are   values(105,119,11);
insert into are   values(105,120,11);
insert into are   values(105,121,11);
insert into are   values(105,122,11);

insert into are   values(105,116,17);
insert into are   values(105,117,17);
insert into are   values(105,118,17);
insert into are   values(105,119,17);
insert into are   values(105,120,17);
insert into are   values(105,121,17);
insert into are   values(105,122,17);

insert into are   values(105,116,19);
insert into are   values(105,117,19);
insert into are   values(105,118,19);
insert into are   values(105,119,19);
insert into are   values(105,120,19);
insert into are   values(105,121,19);
insert into are   values(105,122,19);

-- dumas -106   - carte 123: categorie 12, 20; carte 124: categorie 12,11
insert into are   values(106, 123, 12);
insert into are   values(106, 123, 20);
insert into are   values(106, 124, 12);
insert into are   values(106, 124, 11);

--dickens - marile sperante
insert into are   values(101, 103, 21);

select * from are;
---------------------------------------------------------
--orase
CREATE SEQUENCE SEQ_OR
INCREMENT by 10
START WITH 1000
MAXVALUE 10000
NOCYCLE;

insert into orase   values(SEQ_OR.NEXTVAL, 'Bucuresti', null, '012581');
insert into orase   values(SEQ_OR.NEXTVAL, 'Oradea', 'Bihor', '410001');
insert into orase   values(SEQ_OR.NEXTVAL, 'Cluj-Napoca', 'Cluj', '010292');
insert into orase   values(SEQ_OR.NEXTVAL, 'Iasi', 'Iasi', '700028');
insert into orase   values(SEQ_OR.NEXTVAL, 'Drobeta Turnul Severin', 'Mehedinti', '220036');
insert into orase   values(SEQ_OR.NEXTVAL, 'Voluntari', 'Ilfov', '077191');

select*from orase;

--locatii
CREATE SEQUENCE SEQ_LOC
INCREMENT by 10
START WITH 90
MAXVALUE 1000
NOCYCLE;

insert into locatii   values(SEQ_LOC.NEXTVAL, 1000, 'Strada Doamnei', 20);
insert into locatii   values(SEQ_LOC.NEXTVAL, 1020, 'Strada Fierului', 2);
insert into locatii   values(SEQ_LOC.NEXTVAL, 1020, 'Strada Republicii', 35);
insert into locatii   values(SEQ_LOC.NEXTVAL, 1010, 'Strada Avram Iancu', 10);
insert into locatii   values(SEQ_LOC.NEXTVAL, 1030, 'Strada Vasile Lupu', 148);
insert into locatii   values(SEQ_LOC.NEXTVAL, 1040, 'Strada Gheorghe Sincai', 17);
insert into locatii   values(SEQ_LOC.NEXTVAL, 1000, 'Strada Baltaretului', 7);

select* from locatii;

--librarie
CREATE SEQUENCE SEQ_LIBR
INCREMENT by 10
START WITH 40
MAXVALUE 1000
NOCYCLE;

insert into librarii   values(SEQ_LIBR.NEXTVAL,to_date('10-10-2015','dd-mm-yyyy'), 'Libraria Iulius',90,	1000);
insert into librarii   values(SEQ_LIBR.NEXTVAL,to_date('06-11-2020','dd-mm-yyyy'), 'Libraria Iulius',100,	1020);
insert into librarii   values(SEQ_LIBR.NEXTVAL,to_date('04-06-2017','dd-mm-yyyy'), 'Libraria Iulius',130,	1030);
insert into librarii   values(SEQ_LIBR.NEXTVAL,to_date('10-08-2010','dd-mm-yyyy'), 'Libraria Iulius',120,	1010);
insert into librarii   values(SEQ_LIBR.NEXTVAL,to_date('16-05-2008','dd-mm-yyyy'), 'Libraria Iulius',110,	1020);

select* from librarii;

--angajati
CREATE SEQUENCE SEQ_ANG
INCREMENT by 1
START WITH 400
MAXVALUE 10000
NOCYCLE;

insert into angajati   values(SEQ_ANG.NEXTVAL, 'Popescu', 'Maria', 1275, '0761234567','f','vanzator',40);
insert into angajati   values(SEQ_ANG.NEXTVAL, 'Popa', 'Marin', 2450, '0761236666','m','vanzator',60);
insert into angajati   values(SEQ_ANG.NEXTVAL, 'Ionescu', 'Adiel', 2725, '0769999967','m','vanzator',70);
insert into angajati   values(SEQ_ANG.NEXTVAL, 'Marinescu', 'Claudiu', 1600, '0761234000','m','vanzator',80);
insert into angajati   values(SEQ_ANG.NEXTVAL, 'Ionescu', 'Mircea', 1550, '0731114567','m','ingrijitor',80);
insert into angajati   values(SEQ_ANG.NEXTVAL, 'Georgescu', 'Aurica', 1500, '0724444413','f','ingrijitor',70);
insert into angajati   values(SEQ_ANG.NEXTVAL, 'Popa', 'Marinela', 1450, '0760004567','f','ingrijitor',60);
insert into angajati   values(SEQ_ANG.NEXTVAL, 'Noiescu', 'Amalia', 1970, '0761233357','f','ingrijitor',40);

insert into angajati   values(SEQ_ANG.NEXTVAL, 'Iona', 'Adrian', 1300, '0733333387','m','vanzator',40);
insert into angajati   values(SEQ_ANG.NEXTVAL, 'Popovici', 'Adina', 1750, '0727677606','f','vanzator',50);
insert into angajati   values(SEQ_ANG.NEXTVAL, 'Mihaita', 'Claudia', 1000, '0729090909','f','vanzator',50);
insert into angajati   values(SEQ_ANG.NEXTVAL, 'Vasilescu', 'Lenuta', 1600, '0761114597','f','ingrijitor',50);

commit;
select* from angajati;

--bonuri
CREATE SEQUENCE SEQ_CUMP
INCREMENT by 1
START WITH 100
MAXVALUE 1000
NOCYCLE; 
                                                                                        ---carte-angajat
insert into bonuri   values(SEQ_CUMP.NEXTVAL ,to_date('20-04-2021 11:30', 'dd-mm-yyyy hh24:mi'),100,400);
insert into bonuri   values(SEQ_CUMP.NEXTVAL ,to_date('20-07-2020 21:17', 'dd-mm-yyyy hh24:mi'),115,408);
insert into bonuri   values(SEQ_CUMP.NEXTVAL ,to_date('20-07-2020 21:17', 'dd-mm-yyyy hh24:mi'),114,408);
insert into bonuri   values(SEQ_CUMP.NEXTVAL ,to_date('20-07-2020 21:17', 'dd-mm-yyyy hh24:mi'),113,408);
insert into bonuri   values(SEQ_CUMP.NEXTVAL ,to_date('04-10-2019 13:55', 'dd-mm-yyyy hh24:mi'),103,401);
insert into bonuri   values(SEQ_CUMP.NEXTVAL ,to_date('25-03-2021 11:30', 'dd-mm-yyyy hh24:mi'),104,409);
insert into bonuri   values(SEQ_CUMP.NEXTVAL ,to_date('25-03-2021 17:00', 'dd-mm-yyyy hh24:mi'),102,410);
insert into bonuri   values(SEQ_CUMP.NEXTVAL ,to_date('26-02-2021 10:00', 'dd-mm-yyyy hh24:mi'),104,409);
insert into bonuri   values(SEQ_CUMP.NEXTVAL ,to_date('13-10-2020 16:44', 'dd-mm-yyyy hh24:mi'),116,410);
insert into bonuri   values(SEQ_CUMP.NEXTVAL ,to_date('29-08-2018 14:02', 'dd-mm-yyyy hh24:mi'),123,410);
insert into bonuri   values(SEQ_CUMP.NEXTVAL ,to_date('15-09-2019 15:17', 'dd-mm-yyyy hh24:mi'),105,402);
insert into bonuri   values(SEQ_CUMP.NEXTVAL, to_date('15-08-2020 15:17', 'dd-mm-yyyy hh24:mi'),115,400);
commit;
select * from bonuri;


--stoc
insert into stoc values(100, 40, 2);
insert into stoc values(115, 40, 3);
insert into stoc values(114, 40, 1);
insert into stoc values(113, 40, 4);
insert into stoc values(103, 80, 3);
insert into stoc values(104, 60, 5);
insert into stoc values(102, 50, 2);
insert into stoc values(104, 80, 6);
insert into stoc values(116, 50, 4);
insert into stoc values(123, 50, 4);
insert into stoc values(105, 70, 3);
insert into stoc values(100, 60, 2);
insert into stoc values(101, 80, 1);
insert into stoc values(102, 40, 2);
insert into stoc values(103, 60, 3);
insert into stoc values(104, 50, 6);
insert into stoc values(105, 50, 4);
insert into stoc values(106, 50, 4);
insert into stoc values(107, 50, 5);
insert into stoc values(108, 50, 4);
insert into stoc values(109, 80, 3);
insert into stoc values(110, 80, 2);
insert into stoc values(111, 80, 3);
insert into stoc values(112, 80, 5);
insert into stoc values(103, 50, 6);
insert into stoc values(114, 50, 7);
insert into stoc values(115, 50, 10);
insert into stoc values(116, 70, 12);
insert into stoc values(117, 70, 11);
insert into stoc values(118, 70, 2);
insert into stoc values(119, 70, 7);
insert into stoc values(120, 70, 8);
insert into stoc values(121, 70, 4);
insert into stoc values(122, 70, 6);
insert into stoc values(123, 60, 8);
insert into stoc values(124, 60, 9);

insert into stoc values(109, 40, 4);
insert into stoc values(109, 60, 5);
insert into stoc values(123, 70, 9);
insert into stoc values(124, 70, 6);

select * from stoc;
select * from scriitori;
select * from categorii;
select * from are;
select * from carti;
select * from serii;
select * from angajati;
select * from bonuri;
select * from librarii;
select * from locatii;
select * from orase;


6.Cerinta:
Pentru a determina ce carti atrag cel mai mult cumparatorii, se doreste sa se determine care sunt genurile de carti
ce au fost cautate cel mai des in anul curent.
In rezolvarea problemei am folosit un tablou indexat si un tablou imbricat.

--Cartile cu codurile 100, 102, 104, 104 au fost cumparate in anul curent(2021) 
--se lasa codurile care apar de mai multe ori(nu folosesc distinct)deoarece inseamna ca categoria din care face parte 
--cartea respectiva este de mai multe ori cautata.
--Categoriile acestor carti au codurile 10, 16, 11, 14, dar de fapt conteaza de 
--cate ori apare fiecare cod:
--10 apare de 2 ori   (pentru cartile 100 si 102)
--16 apare 1 data     (pentru cartea 100)
--11 apare de 3 ori   (pentru cartile 102, 104, 104)
--14 apare de 3 ori   (pentru cartile 102, 126, 104)
--asta inseamna ca ne intereseaza doar codurile 11 si 14
--Se afiseaza:
--Este cautat genul fictiune
--Este cautat genul crestin

create or replace procedure categorii_cautate
is
    type tab_ind is table of number index by PLS_INTEGER; 
    nr_aparitii tab_ind;           --retin numarul de aparitii al fiecarui cod
    type tab_imb is table of are.cod_categorie%type;   
    v_coduri tab_imb := tab_imb(); --retin codul categoriilor cautate
    
    nr_max_aparitii number := 0;  
    ok number;
    indice number;
    v_gen categorii.gen%type;
begin 
    for vanzari in ( select max(cod_carte) cod, count(*) numar
                    from bonuri  
                    where extract(year from data_bon) = extract(year from sysdate)
                    group by cod_carte
                     ) loop
        for categ_cautate in (select distinct cod_categorie   
                                                        --am nevoie de distinct pentru cazul in care cartea respectiva 
                                                        --este scrisa de mai multi scriitori => in tabelul are va fi
                                                        --trecuta cartea si categoria de n numar de ori , unde n 
                                                        --este numarul de scriitori.
                            from are  
                            where cod_carte = vanzari.cod
                            ) loop
            ok := 0;
            indice :=  v_coduri.first;
            
            --ma plimb prin codurile categoriilor selectate deja si, daca gasesc codul curent, cresc numarul de aparitii;
            --observatie: o categorie poate fi reprezentativa pentru mai multe carti vandute
            while indice <= v_coduri.last and ok = 0 loop   
                if v_coduri(indice) = categ_cautate.cod_categorie then
                    nr_aparitii(indice) := nr_aparitii(indice) + vanzari.numar;
                    ok := 1;
                    
                    if nr_aparitii(indice) > nr_max_aparitii then
                        nr_max_aparitii := nr_aparitii(indice);
                    end if;
                end if;
                indice := indice + 1;
            end loop;
            
            if ok = 0 then   --inseamna ca aceasta categorie nu a fost inca trecuta in colectie
                v_coduri.extend;
                v_coduri(v_coduri.last) := categ_cautate.cod_categorie;
                nr_aparitii(v_coduri.last) := vanzari.numar;
            end if;                
        
        end loop;
    end loop;

    if nr_aparitii.count = 0   --orice carte se incadreaza in cel putin o categorie, deci, daca 
                               --tabloul ramane gol, inseamna ca nu a existat nicio carte selectata initial
    then   
        dbms_output.put_line('Nu au fost cumparate carti in anul curent.');
    else
        for i in nr_aparitii.first..nr_aparitii.last loop
            if nr_aparitii(i) = nr_max_aparitii then
                select gen into v_gen
                from categorii  
                where cod_categorie = v_coduri(i);
                
                dbms_output.put_line('Este cautat genul ' || v_gen);
            end if;
        end loop;
    end if;
    
end categorii_cautate;
/
execute categorii_cautate; 

--select * from bonuri;
--delete from bonuri;
--rollback;

7.Cerinta:
Pentru un nume de scriitor dat, determinati cat costa fiecare serie pe care a 
scris-o in cazul in care cumparatorul ar dori sa cumpere toate volumele. 
Se doreste sa se afiseze pentru fiecare serie pretul acesteia, precum si un mesaj 
sugestiv in cazul in care scriitorul dat nu a scris nicio serie de carti. Se 
trateaza exceptia daca numele dat nu apare in baza de date.

create or replace procedure pret_serie(nume_scriitor in scriitori.nume%type default 'none')
is
    cursor suma_serie (id scriitori.cod_scriitor%type) is
        select sum(pret) suma, cod_serie  --det. suma unei serii si codul acesteia
        from carti
        where cod_serie is not null and cod_carte in (  select distinct cod_carte 
                                                        from are
                                                        where cod_scriitor = id 
                                                      )--det. cartile scrise de acel scriitor
        group by cod_serie;
    
    v_serie serii.nume%type;
    v_cod_serie serii.cod_serie%type;
    v_suma number;
    v_cod_scriitor scriitori.cod_scriitor%type;
begin
    
    select cod_scriitor into v_cod_scriitor
    from scriitori
    where upper(nume) = upper(nume_scriitor); 
    --Daca numele dat nu se afla in baza de date, se va declansa eroarea NO_DATA_FOUND
    
    open suma_serie(v_cod_scriitor);
    loop
        fetch suma_serie into v_suma, v_cod_serie;
        exit when suma_serie%NOTFOUND;
        
            select nume into v_serie   --det. numele seriei cu acel cod
            from serii
            where cod_serie = v_cod_serie;
            
            dbms_output.put_line('Seria "'||v_serie||'" costa '||v_suma|| ' lei.');
    end loop;
    
    if suma_serie%rowcount = 0 then 
        dbms_output.put_line('Nu exista in librarie nicio serie scrisa de acest scriitor.');
    end if;
    
    close suma_serie;
    
    exception
        when NO_DATA_FOUND then
            RAISE_APPLICATION_ERROR(-20000,'Nu exista niciun scriitor cu acest nume.');
        when others then
            RAISE_APPLICATION_ERROR (-20001,'Alta eroare');
end pret_serie;
/

begin

--    pret_serie('Witemeyer');  
--        Nu exista in librarie nicio serie scrisa de acest scriitor.
--    pret_serie('Oke');
--        Seria "Cantecul Acadiei" costa 136.5 lei.
--        Seria "Anotimpurile inimii" costa 87.4 lei.
--        Seria "Faptele credintei" costa 105 lei.
    pret_serie;    
        --Eroarea are codul = -20000 si mesajul = ORA-20000: Nu exista niciun scriitor cu acest nume.
    
    exception
        when others 
            then dbms_output.put_line('Eroarea are codul = '||SQLCODE || ' si mesajul = ' || SQLERRM);
end;
/


8.Cerinta:
Intr-o libraria de la o locatie data prin nume vine un client care doreste sa cumpere o carte
anume, data tot prin titlu. Sa se precizeze fiecare caz posibil, anume cartea sa existe in
libraria respectiva si sa se creeze un nou bon (nu conteaza ce vanzator o vinde) si sa se modifice
numarul de exemplare disponibile pe stoc, dar si cazul in care cartea nu exista.

Singura exceptie care apare este cea declansata de mine NO_DATA_FOUND. Intra pe aceasta exceptie
in cazul in care nu se gaseste cartea aceea in stocul acelei librarii, deci nu se poate cumpara cartea

rollback;
set serveroutput on;

create or replace function client_cumpara_carte(carte_ceruta carti.denumire%type default 'no_name',
                                                librarie_de_unde_se_solicita locatii.strada%type default 'no_adress'
                                                )
    return carti.pret%type is
    
    carte_vanduta stoc.cod_carte%type;
    librarie_care_vinde stoc.cod_librarie%type;
    pret_cumparare carti.pret%type;
begin

    update stoc 
    set nr_exemplare = nr_exemplare - 1
    where (cod_carte, cod_librarie) = 
            (
            select cod_carte, st.cod_librarie   -- daca cartea dorita se gaseste la libraria
                                                -- mentionata, selectul va intoarce o linie
            from locatii loc join librarii lib on (loc.cod_locatie=lib.cod_locatie) 
            join (  select cod_carte, cod_librarie     --selectez toate codurile librariile in care se gaseste cartea dorita
                    from carti join stoc using (cod_carte)
                    where upper(denumire) = upper(carte_ceruta)
                  ) st on(st.cod_librarie = lib.cod_librarie)  --joinul se face pe cod librarie
            where upper(strada) = upper (librarie_de_unde_se_solicita)   --selectez libraria dorita
            )
    returning cod_carte, cod_librarie into carte_vanduta, librarie_care_vinde;
       
    if sql%rowcount = 0 then    --stim ca UPDATE nu intoarce NO_DATA_FOUND asadar verific 
        raise NO_DATA_FOUND;    --eu cate linii s-au modificat(maxim 1 in cazul nostru) si tratez exceptia dorita 
    end if;
 
    insert into bonuri 
    select SEQ_CUMP.nextval, sysdate, carte_vanduta, (
                                select cod_angajat
                                from (  --aranjez vanzatorii care lucreaza la acea librarie
                                        --in mod random pentru ca fiecare sa aiba sansa sa vanda clientului
                                        select cod_angajat  
                                        from angajati
                                        where cod_librarie = librarie_care_vinde and tip_angajat = 'vanzator'
                                        ORDER BY DBMS_RANDOM.RANDOM
                                    )
                                where rownum = 1
                               )  
    from dual;
    
    --daca se ajunge pana aici inseamna ca o carte a fost vanduta, deci urmeaza sa selectez pretul 
    --pentru a-l transmite clientului
    select pret 
    into pret_cumparare
    from carti
    where cod_carte = carte_vanduta;            
   
    return pret_cumparare;
    
    exception
        when NO_DATA_FOUND then 
            RAISE_APPLICATION_ERROR(-20000, 'Ne pare rau, nu avem cartea '|| carte_ceruta ||
                                    ' pe stoc la locatia ' || librarie_de_unde_se_solicita);
        when others then
            RAISE_APPLICATION_ERROR(-20001, SQLERRM);
    
end client_cumpara_carte;
/

select * from bonuri;
declare
--    carte carti.denumire%type := 'Invitatia la vals';  --cod_carte: 100
--    strada locatii.strada%type := 'Strada Doamnei';    --cod_librarie: 40
    carte carti.denumire%type := 'Invitatia la vals';
    strada locatii.strada%type := 'Strada Fierului'; 
begin
    dbms_output.put_line('Clientul a platit '||client_cumpara_carte(carte, strada)||' lei pe cartea '||carte|| '.');
    
    exception
        when others then
            dbms_output.put_line(SQLERRM);
end;
/

rollback;
alter table stoc
disable all triggers;


select * from bonuri;
select * from stoc;
commit;
/        


9. Cerinta:
Determinati care este bestsellerul dintr-un oras dat de la tastatura. Se mentioneaza ca 
bestsellerul trebuie sa reprezinte o singura cartea (cea care a fost vanduta de numarul 
maxim de ori) si se va afisa impreuna cu numarul de exemplare date. Daca sunt mai multe 
carti vandute de numar maxim de ori, se va afisa un mesaj sugestiv. La fel se va proceda 
si in cazul in care in orasul respectiv nu s-a vandut inca nicio carte.
--s-au apelat tabelele bonuri, carti, angajati, librarii, orase  intr-o singura comanda SQL

create or replace procedure bestseller(nume_oras orase.denumire%type default 'none')
is
    v_numar number;
    v_nume carti.denumire%type := 'niciunul';
    
    cursor vanzari_carte(parametru orase.denumire%type)
    is
    select count(bon.cod_carte) nr, max(car.denumire) den
                --determin pentru fiecare carte vanduta de cate ori a fost vanduta
    from bonuri bon join carti car on (bon.cod_carte=car.cod_carte)
    where cod_angajat in (
                select cod_angajat   --determin codul vanzatorilor care sunt angajati intr-o librarie din orasul dat
                from angajati 
                where lower(tip_angajat) = 'vanzator' 
                    and cod_librarie in (
                                        select cod_librarie   --codurile librariilor din acel oras
                                        from librarii 
                                        where cod_oras = (
                                                            select cod_oras      --codul orasului dat
                                                            from orase 
                                                            where upper(denumire) = upper(parametru)
                                                          )
                                        )
                            )
    group by bon.cod_carte  --le grupez in functie de cod_carte
    order by count(bon.cod_carte) desc;  
    
begin

    for i in vanzari_carte(nume_oras) loop
        if vanzari_carte%rowcount = 1 then   --pentru prima linie intoarsa de cursor
            v_numar := i.nr;
            v_nume := i.den;  --daca cursorul intoarce cel putin o linie, inseamna ca v_nume isi va schimba valoarea
        end if;
        if vanzari_carte%rowcount = 2 then
            if v_numar = i.nr then
                raise TOO_MANY_ROWS;  --inseamna ca sunt cel putin 2 carti care au fost vandute de numar maxim de ori
            end if;
        end if;
    end loop;
    
    if v_nume = 'niciunul' then  --in cazul in care cursorul nu intoarce nimic
        raise NO_DATA_FOUND;
    end if;
    
    dbms_output.put_line('Bestsellerul din orasul ' || nume_oras||
                        ' este "'||v_nume||
                        '" si a fost vandut de '||v_numar||
                        ' ori.');    
                        
    exception
        when NO_DATA_FOUND then
            RAISE_APPLICATION_ERROR (-20000,'Nu exista carti vandute in orasul ' || nume_oras);
        when TOO_MANY_ROWS then
            RAISE_APPLICATION_ERROR (-20001,'Sunt mai multe carti vandute de numar maxim de ori in orasul '||nume_oras);
        when others then
            RAISE_APPLICATION_ERROR (-20002,'Alta eroare');
end bestseller;
/

set serveroutput on;

declare 
    oras orase.denumire%type := '&oras';
begin
    bestseller(oras);
    
    exception
        when others then
            dbms_output.put_line('Eroarea are codul = '||SQLCODE||
                        ' si mesajul = '||SQLERRM);
end;
/
--Pentru Cluj-Napoca --Bestsellerul din orasul cluj-napoca este "Mostenirea" si a fost vandut de 2 ori.
--Pentru Iasi --Bestsellerul din orasul iasi este "Marile sperante" si a fost vandut de 1 ori.
--Pentru Drobeta Turnul Severin  --Eroarea are codul = -20000 si mesajul = ORA-20000: Nu exista carti vandute in orasul Drobeta Turnul Severin
--Petru Bucuresti --Eroarea are codul = -20001 si mesajul = ORA-20001: Sunt mai multe carti vandute de numar maxim de ori in orasul Bucuresti



--Exercitiul 10 si 11
--Triggeri pe tabel mutating

Cerinta:
4 este pragul de exemplare gasite in stoc per carte (la nivelul tuturor librariilor) pentru care se aplica o 
reducere de 10% (deci se presupune ca o reducere se aplica atunci cand sunt <= 4 exemplare). 
Cand un client cumpara o carte, in trigger se va specifica daca primeste reducere si se va actualiza pretul. 
Trebuie sa avem grija si de stoc, sa se stearga din lista cartea daca nu mai sunt exemplare la acea librarie.

--Mod de actualizare: 
--Utilitatea triggerilor la nivel de comanda si de linie (before)
--se modifica pretul cartii din tabelul CARTI. (se face update in tabel)
--Actualizarea se face o singura data, atunci cand cineva cumpara a 4 a carte, apoi daca sunt mai putin de 4 carti,
--se specifica faptul ca reducerea a fost facuta (dar nu se face din nou update pentru ca asta ar insemna ca se 
--aplica reducerea de doua ori)

--Este nevoie si de un trigger after update on stoc care sa stearga
--cartea din stocul librariei respectivei in cazul in care nu mai sunt exemplare.


CREATE OR REPLACE PACKAGE pachet
IS
    type evidenta is table of carti.cod_carte%type;
    retin_carti_aplic_reducere evidenta;
    retin_carti_reducere_aplicata evidenta;
END;
/

create or replace trigger aplicare_reducere
BEFORE update of nr_exemplare on stoc
begin

    --pastrez intr-un tablou imbricat lista codurilor cartilor care sunt fix 4 in stoc => asta inseamna ca 
    --daca cartea inserata se gaseste in lista, se va face update pe CARTI
    select cod_carte 
    bulk collect into pachet.retin_carti_aplic_reducere
    from stoc  
    group by cod_carte
    having sum(nr_exemplare) = 4;
    
    --pastrez intr-un tablou imbricat lista codurilor cartilor care sunt mai putin de 4 in stoc => asta inseamna ca
    --daca cartea inserata se gaseste in lista, ea profita de reducere, dar nu se mai face update
    select cod_carte 
    bulk collect into pachet.retin_carti_reducere_aplicata
    from stoc 
    group by cod_carte
    having sum(nr_exemplare) < 4;

end;
/

create or replace trigger cumparare_carte
BEFORE update of nr_exemplare on stoc
for each row
declare
    nr number;
    ok number := 0;
begin

    nr := pachet.retin_carti_aplic_reducere.first;
    while nr <= pachet.retin_carti_aplic_reducere.last and ok = 0 loop
        if pachet.retin_carti_aplic_reducere(nr) = :old.cod_carte then 
            update carti
            set pret = pret - 0.1*pret
            where pachet.retin_carti_aplic_reducere(nr) = cod_carte;
            
            ok := 1;
        end if;
        nr := pachet.retin_carti_aplic_reducere.next(nr);
    end loop;
        
    if ok = 0 then
        nr := pachet.retin_carti_reducere_aplicata.first;
        while nr <= pachet.retin_carti_reducere_aplicata.last and ok = 0 loop
            if pachet.retin_carti_reducere_aplicata(nr) = :old.cod_carte then 
                ok := 1;
            end if;
            nr := pachet.retin_carti_reducere_aplicata.next(nr);
        end loop;
    end if;
    
    if ok = 1 then
        dbms_output.put_line('Se aplica reducere de 10% deoarece cumparati una dintre ultimele 4 exemplare din stoc'); 
    end if;

end;
/

--trigger la nivel de comanda -- after pentru stergere din stoc
--nu pot folosi trigger la nivel de linie pentru ca ar recepta tabelul ca mutating
--dar in acest caz la fel de bine pot folosi un trigger la nivel de comanda
create or replace trigger nu_mai_exista_pe_stoc
AFTER update of nr_exemplare on stoc
begin
   
    delete from stoc
    where nr_exemplare = 0;
    
end; 
/

declare
-- Cartea 'Mireasa pe masura' (cod 102) se gaseste in stoc in fix 4 exemplare
-- doua in libraria de la aceasta locatie, deci daca am vrea sa comparam de trei ori, nu ne va lasa
-- (celelalte 2 se gasesc la locatia 'Strada Doamnei')

--daca apelez functia o data, se aplica reducerea
--daca o apelez de doua ori, va sterge din stoc cartea unde codul librariei este 50
--daca o apelez de 3 ori, apare eroare
--    carte carti.denumire%type := 'Mireasa pe masura';  --102
--    strada locatii.strada%type := 'Strada Fierului';  --cod: 50
    
-- cartea se gaseste in 5 exemplare  --nu va primi reducere
    carte carti.denumire%type := 'Limanul mult dorit';  --cod: 107
    strada locatii.strada%type := 'Strada Fierului';    --cod: 50

begin
    dbms_output.put_line('Clientul a platit '||client_cumpara_carte(carte, strada)||' lei pe cartea '||carte|| '.');
    
    exception
        when others then
            dbms_output.put_line(SQLERRM);
end;
/
--rollback;

select * from bonuri;
select * from stoc;
select * from carti;
/
commit;

12. Cerinta:
Clientii nu au voie sa modifice baza de date din spatele aplicatiei, iar modificarile facute trebuie sa 
nu intervina cu programul deschis publicului. Asadar pentru schimbari referitoare la obiecte ale schemei 
sau ale bazei de date, administratorul trebuie sa le faca in intervale orare specifice.
Se stie ca in zilele lucratoare, librariile sunt deschise de la 8:00 la 20:00, sambata de la 10:00 la 19:00, 
iar duminica de la 12:00 la 16:00. 
Triggerul creat va limita modificari la nivel de schema si are nevoie de o procedura pentru a putea insera in 
tabel modificarea dorita, precum si un mesaj corespunzator.

CREATE TABLE info
(utilizator VARCHAR2(30),
nume_bd VARCHAR2(50),
eveniment VARCHAR2(20),
nume_obiect VARCHAR2(30),
data DATE,
mesaj VARCHAR2(40));

create or replace procedure inserez_in_info(cod number)
is 
    mesaj varchar2(40);
    pragma autonomous_transaction;
begin
    if cod = 1 then
        mesaj := 'eroare: in timpul programului';
    elsif cod = 2 then 
        mesaj :=  'eroare: not admin';
    else
        mesaj := 'succes';
    end if;
         
    INSERT INTO info
    VALUES (SYS.LOGIN_USER, SYS.DATABASE_NAME, SYS.SYSEVENT, SYS.DICTIONARY_OBJ_NAME, SYSDATE, mesaj);
    
    commit;
end inserez_in_info;
/


create or replace trigger LDD
before CREATE OR DROP OR ALTER ON SCHEMA
begin 
    if (to_char(sysdate, 'D') = 1 and (TO_CHAR(SYSDATE,'HH24') BETWEEN 12 AND 16)) --pentru duminica 
    or
    (to_char(sysdate, 'D') = 7 and (TO_CHAR(SYSDATE,'HH24') BETWEEN 10 AND 19))  --pentru sambata
    or
   (to_char(sysdate, 'D') <> 1 and to_char(sysdate, 'D') <> 7 and (TO_CHAR(SYSDATE,'HH24') BETWEEN 8 AND 20))  --pentru zilele lucratoare
    then  
        inserez_in_info(1);
        RAISE_APPLICATION_ERROR(-20000, 'Nu sunt permise modificari ale schemei in timpul programului cu publicul');
    else
        if  sys.login_user <> 'DENISA' then  --doar administratorul poate modifica
            inserez_in_info(2);      
            RAISE_APPLICATION_ERROR(-20000, 'Doar administratorul poate modifica baza de date');
       
        end if;
    end if;
    
    inserez_in_info(0);
    dbms_output.put_line('Modificare cu succes');

end;
/
--Pentru cazul in care nu sunt administrator aka sys.login_user <> 'DENISA' nu pot face verificarea, dar
--in schimb pot scrimba stringul 'DENISA' in 'DENIS' si cum 'DENISA' <> 'DENIS' va intra pe acea conditie.
--drop trigger LDD;

select * from info;

select to_char(data, 'hh24'), to_char(data, 'D')
from info
where data like sysdate;

create table test (i int);  
drop table test;


--exercitiul 13.
create or replace package pachet13
is
    --6.
    procedure categorii_cautate;
    --7.
    procedure pret_serie(nume_scriitor in scriitori.nume%type default 'none');
    --8.
    function client_cumpara_carte(carte_ceruta carti.denumire%type default 'no_name',
                                                    librarie_de_unde_se_solicita locatii.strada%type default 'no_adress'
                                                    )
    return carti.pret%type;
    --9.
    procedure bestseller(nume_oras orase.denumire%type default 'none');
end;
/

create or replace package body pachet13
is
    --6
    procedure categorii_cautate
    is
        type tab_ind is table of number index by PLS_INTEGER; 
        nr_aparitii tab_ind;           --retin numarul de aparitii al fiecarui cod
        type tab_imb is table of are.cod_categorie%type;   
        v_coduri tab_imb := tab_imb(); --retin codul categoriilor cautate
        
        nr_max_aparitii number := 0;  
        ok number;
        indice number;
        v_gen categorii.gen%type;
    begin 
        for vanzari in ( select max(cod_carte) cod, count(*) numar
                        from bonuri  
                        where extract(year from data_bon) = extract(year from sysdate)
                        group by cod_carte
                         ) loop
            for categ_cautate in (select distinct cod_categorie   
                                                            --am nevoie de distinct pentru cazul in care cartea respectiva 
                                                            --este scrisa de mai multi scriitori => in tabelul are   va fi
                                                            --trecuta cartea si categoria de n numar de ori , unde n 
                                                            --este numarul de scriitori.
                                from are  
                                where cod_carte = vanzari.cod
                                ) loop
                ok := 0;
                indice :=  v_coduri.first;
                
                --ma plimb prin codurile categoriilor selectate deja si, daca gasesc codul curent, cresc numarul de aparitii;
                --observatie: o categorie poate fi reprezentativa pentru mai multe carti vandute
                while indice <= v_coduri.last and ok = 0 loop   
                    if v_coduri(indice) = categ_cautate.cod_categorie then
                        nr_aparitii(indice) := nr_aparitii(indice) + vanzari.numar;
                        ok := 1;
                        
                        if nr_aparitii(indice) > nr_max_aparitii then
                            nr_max_aparitii := nr_aparitii(indice);
                        end if;
                    end if;
                    indice := indice + 1;
                end loop;
                
                if ok = 0 then   --inseamna ca aceasta categorie nu a fost inca trecuta in colectie
                    v_coduri.extend;
                    v_coduri(v_coduri.last) := categ_cautate.cod_categorie;
                    nr_aparitii(v_coduri.last) := vanzari.numar;
                end if;                
            
            end loop;
        end loop;
    
        if nr_aparitii.count = 0   --orice carte se incadreaza in cel putin o categorie, deci, daca 
                                   --tabloul ramane gol, inseamna ca nu a existat nicio carte selectata initial
        then   
            dbms_output.put_line('Nu au fost cumparate carti in anul curent.');
        else
            for i in nr_aparitii.first..nr_aparitii.last loop
                if nr_aparitii(i) = nr_max_aparitii then
                    select gen into v_gen
                    from categorii  
                    where cod_categorie = v_coduri(i);
                    
                    dbms_output.put_line('Este cautat genul ' || v_gen);
                end if;
            end loop;
        end if;
        
    end categorii_cautate;
    
    --7.
    procedure pret_serie(nume_scriitor in scriitori.nume%type default 'none')
    is
        cursor suma_serie (id scriitori.cod_scriitor%type) is
            select sum(pret) suma, cod_serie  --det. suma unei serii si codul acesteia
            from carti
            where cod_serie is not null and cod_carte in (  select distinct cod_carte 
                                                            from are
                                                            where cod_scriitor = id 
                                                          )--det. cartile scrise de acel scriitor
            group by cod_serie;
        
        v_serie serii.nume%type;
        v_cod_serie serii.cod_serie%type;
        v_suma number;
        v_cod_scriitor scriitori.cod_scriitor%type;
    begin
        
        select cod_scriitor into v_cod_scriitor
        from scriitori
        where upper(nume) = upper(nume_scriitor); 
        --Daca numele dat nu se afla in baza de date, se va declansa eroarea NO_DATA_FOUND
        
        open suma_serie(v_cod_scriitor);
        loop
            fetch suma_serie into v_suma, v_cod_serie;
            exit when suma_serie%NOTFOUND;
            
                select nume into v_serie   --det. numele seriei cu acel cod
                from serii
                where cod_serie = v_cod_serie;
                
                dbms_output.put_line('Seria "'||v_serie||'" costa '||v_suma|| ' lei.');
        end loop;
        
        if suma_serie%rowcount = 0 then 
            dbms_output.put_line('Nu exista in librarie nicio serie scrisa de acest scriitor.');
        end if;
        
        close suma_serie;
        
        exception
            when NO_DATA_FOUND then
                RAISE_APPLICATION_ERROR(-20000,'Nu exista niciun scriitor cu acest nume.');
            when others then
                RAISE_APPLICATION_ERROR (-20001,'Alta eroare');
    end pret_serie;
    
    --8.
    function client_cumpara_carte(carte_ceruta carti.denumire%type default 'no_name',
                                                    librarie_de_unde_se_solicita locatii.strada%type default 'no_adress'
                                                    )
        return carti.pret%type is
        
        carte_vanduta stoc.cod_carte%type;
        librarie_care_vinde stoc.cod_librarie%type;
        pret_cumparare carti.pret%type;
    begin
    
        update stoc 
        set nr_exemplare = nr_exemplare - 1
        where (cod_carte, cod_librarie) = 
                (
                select cod_carte, st.cod_librarie   -- daca cartea dorita se gaseste la libraria
                                                    -- mentionata, selectul va intoarce i linie
                from locatii loc join librarii lib on (loc.cod_locatie=lib.cod_locatie) 
                join (  select cod_carte, cod_librarie     --selectez toate codurile librariile in care se gaseste cartea dorita
                        from carti join stoc using (cod_carte)
                        where upper(denumire) = upper(carte_ceruta)
                      ) st on(st.cod_librarie = lib.cod_librarie)  --joinul se face pe cod librarie
                where upper(strada) = upper (librarie_de_unde_se_solicita)   --selectez libraria dorita
                )
        returning cod_carte, cod_librarie into carte_vanduta, librarie_care_vinde;
           
        if sql%rowcount = 0 then    --stim ca UPDATE nu intoarce NO_DATA_FOUND asadar verific 
            raise NO_DATA_FOUND;    --eu cate linii s-au modificat(maxim 1 in cazul nostru) si tratez exceptia dorita 
        end if;
     
        insert into bonuri 
        select SEQ_CUMP.nextval, sysdate, carte_vanduta, (
                                    select cod_angajat
                                    from (  --aranjez vanzatorii care lucreaza la acea librarie
                                            --in mod random pentru ca fiecare sa aiba sansa sa vanda clientului
                                            select cod_angajat  
                                            from angajati
                                            where cod_librarie = librarie_care_vinde and tip_angajat = 'vanzator'
                                            ORDER BY DBMS_RANDOM.RANDOM
                                        )
                                    where rownum = 1
                                   )  
        from dual;
        
        --daca se ajunge pana aici inseamna ca o carte a fost vanduta, deci urmeaza sa selectez pretul 
        --pentru a-l transmite clientului
        select pret 
        into pret_cumparare
        from carti
        where cod_carte = carte_vanduta;            
       
        return pret_cumparare;
        
        exception
            when NO_DATA_FOUND then 
                RAISE_APPLICATION_ERROR(-20000, 'Ne pare rau, nu avem cartea '|| carte_ceruta ||
                                        ' pe stoc la locatia ' || librarie_de_unde_se_solicita);
            when others then
                RAISE_APPLICATION_ERROR(-20001, SQLERRM);
        
    end client_cumpara_carte;
    
    --9.
    procedure bestseller(nume_oras orase.denumire%type default 'none')
    is
        v_numar number;
        v_nume carti.denumire%type := 'niciunul';
        
        cursor vanzari_carte(parametru orase.denumire%type)
        is
        select count(bon.cod_carte) nr, max(car.denumire) den
                    --determin pentru fiecare carte vanduta de cate ori a fost vanduta
        from bonuri bon join carti car on (bon.cod_carte=car.cod_carte)
        where cod_angajat in (
                    select cod_angajat   --determin codul vanzatorilor care sunt angajati intr-o librarie din orasul dat
                    from angajati 
                    where lower(tip_angajat) = 'vanzator' 
                        and cod_librarie in (
                                            select cod_librarie   --codurile librariilor din acel oras
                                            from librarii 
                                            where cod_oras = (
                                                                select cod_oras      --codul orasului dat
                                                                from orase 
                                                                where upper(denumire) = upper(parametru)
                                                              )
                                            )
                                )
        group by bon.cod_carte  --le grupez in functie de cod_carte
        order by count(bon.cod_carte) desc;  
        
    begin
    
        for i in vanzari_carte(nume_oras) loop
            if vanzari_carte%rowcount = 1 then   --pentru prima linie intoarsa de cursor
                v_numar := i.nr;
                v_nume := i.den;  --daca cursorul intoarce cel putin o linie, inseamna ca v_nume isi va schimba valoarea
            end if;
            if vanzari_carte%rowcount = 2 then
                if v_numar = i.nr then
                    raise TOO_MANY_ROWS;  --inseamna ca sunt cel putin 2 carti care au fost vandute de numar maxim de ori
                end if;
            end if;
        end loop;
        
        if v_nume = 'niciunul' then  --in cazul in care cursorul nu intoarce nimic
            raise NO_DATA_FOUND;
        end if;
        
        dbms_output.put_line('Bestsellerul din orasul ' || nume_oras||
                            ' este "'||v_nume||
                            '" si a fost vandut de '||v_numar||
                            ' ori.');    
                            
        exception
            when NO_DATA_FOUND then
                RAISE_APPLICATION_ERROR (-20000,'Nu exista carti vandute in orasul ' || nume_oras);
            when TOO_MANY_ROWS then
                RAISE_APPLICATION_ERROR (-20001,'Sunt mai multe carti vandute de numar maxim de ori in orasul '||nume_oras);
            when others then
                RAISE_APPLICATION_ERROR (-20002,'Alta eroare');
    end bestseller;

end;
/


declare
v number;
begin
    v := pachet13.client_cumpara_carte('Mireasa pe masura', 'Strada Doamnei');  --carte 102; librarie 40;
end;
/
rollback;
select * from stoc;



14.Cerinta: 
Un client vine la o librarie (data prin strada pe care se afla) si cere o serie de carti (data prin numele
acesteia). Se verifica daca se gaseste seria respectiva pe stoc si in caz afirmativ, se ofera clientului o 
reducere de 10% la pretul total al seriei. Daca nu se gasesc toate cartile din serie pe stoc, clientul cumpara 
cartile care se gasesc, dar nu primeste reducere. Sa se afiseze si cartile cumparare de client, precum
si pe cele pe care ar fi vrut sa le cumpere daca le gasea. La final se prezinta pretul.

Pentru a nu mai beneficia si de alte reduceri, triggerii creati la ex 10 si 11 sunt dezactivati.

ALTER TABLE STOC
DISABLE ALL TRIGGERS;

create or replace package pachet14 
is
    
    type tab_imb is table of carti.cod_carte%type;  --tabel imbricat
    
    TYPE informatii_return IS RECORD (
                        pret_total number,
                        lista_carti_gasite tab_imb := tab_imb(),
                        lista_carti_care_nu_se_gasesc tab_imb := tab_imb());
    
    cursor lista_carti_din_serie(parametru serii.cod_serie%type)   --det. cartile dintr-o serie si pretul fiecareia dintre ele
    is
        select cod_carte, pret
        from carti
        where cod_serie = parametru;
        
    function det_librarie(nume_strada locatii.strada%type)   --det. codul unei librarii
    return librarii.cod_librarie%type;
    
    function det_serie(nume_serie serii.nume%type)   --det. codul unei serii de carti
    return serii.cod_serie%type;
    
    function informatii_cerere_serie(id_serie serii.cod_serie%type,
                                    id_librarie librarii.cod_librarie%type)
    return informatii_return;
    
    procedure cerere(nume_serie serii.nume%type,
                    nume_strada locatii.strada%type);        
     
    procedure vanzare(id_librarie librarii.cod_librarie%type,
                      lista_carti tab_imb);
end;
/


create or replace package body pachet14 
is

    function det_librarie(nume_strada locatii.strada%type)  --det. codul librariei care se afla pe o strada data
    return librarii.cod_librarie%type
    is
    v_cod librarii.cod_librarie%type;
    begin
        select cod_librarie
        into v_cod
        from librarii join locatii using(cod_locatie)
        where upper(strada) = upper(nume_strada);
        
        return v_cod;
        
        exception
            when NO_DATA_FOUND then
                RAISE_APPLICATION_ERROR(-20000, 'Nu exista librarie pe aceasta strada');
    end;
    
    
    function det_serie(nume_serie serii.nume%type)  --det. codul seriei cu numele dat
    return serii.cod_serie%type
    is
    v_cod serii.cod_serie%type;
    begin
        select cod_serie
        into v_cod
        from serii
        where upper(nume) = upper(nume_serie);
        
        return v_cod;
        
        exception
            when NO_DATA_FOUND then
                RAISE_APPLICATION_ERROR(-20000, 'Nu exista serie cu acest nume');
    end;
    
      
    --se realizeaza o vanzare
    procedure vanzare(id_librarie librarii.cod_librarie%type,
                      lista_carti tab_imb)
    is
    ang bonuri.cod_angajat%type;
    i number;
    numar_exemplare stoc.nr_exemplare%type;
    begin
        select cod_angajat
        into ang
        from (  --aranjez vanzatorii care lucreaza la acea librarie
                --in mod random pentru ca fiecare sa aiba sansa sa vanda clientului
                select cod_angajat  
                from angajati
                where cod_librarie = id_librarie  and tip_angajat = 'vanzator'
                ORDER BY DBMS_RANDOM.RANDOM
            )
        where rownum = 1;
        
        i := lista_carti.first;
        while i <= lista_carti.last loop    --se cumpara cartile care fac parte din acea serie gasite in librarie 
            update stoc
            set nr_exemplare = nr_exemplare - 1
            where lista_carti(i) = cod_carte and id_librarie = cod_librarie
            returning nr_exemplare into numar_exemplare; 
            
            if numar_exemplare = 0 then   --trebuie sa sterg cartea din stocul librariei daca nu mai exista exemplare
                delete from stoc 
                where lista_carti(i) = cod_carte and id_librarie = cod_librarie;
            end if;
    
            insert into bonuri
            values (SEQ_CARTI.NEXTVAL, sysdate, lista_carti(i), ang);
                 
            i := lista_carti.NEXT(i);
        end loop;
    end;
    
   
    --det. lista cartile din serie care se gasesc in libraria dorita, precum si lista celor care nu se gasesc
    function informatii_cerere_serie(id_serie serii.cod_serie%type,
                                    id_librarie librarii.cod_librarie%type)
    return informatii_return
    is 
    info informatii_return;  --(pret_total_comanda, lista_carti_cumparate, lista_carti_care_nu_se_gasesc)
    exista number;
    begin
                        
        info.pret_total := 0;
        
        for i in lista_carti_din_serie(id_serie)  --nu pot sa iau suma preturilor cartilor printr-un singur select in 
        loop                                      --cazul in care nu se gaseste toata seria
            select count(*)
            into exista
            from stoc
            where i.cod_carte = cod_carte and id_librarie = cod_librarie; 
                        
            if exista = 1 then   --inseamna ca acea carte exista in libraria respectiva
            
                info.pret_total := info.pret_total + i.pret;
                info.lista_carti_gasite.EXTEND;
                info.lista_carti_gasite(info.lista_carti_gasite.last) :=  i.cod_carte;
            else
                info.lista_carti_care_nu_se_gasesc.EXTEND;
                info.lista_carti_care_nu_se_gasesc(info.lista_carti_care_nu_se_gasesc.last) :=  i.cod_carte;
            end if;
        end loop;
        
        return info;
    end;
    
    
    procedure cerere(nume_serie serii.nume%type,
                    nume_strada locatii.strada%type)
    is
    id_librarie stoc.cod_librarie%type;
    retin_date informatii_return;
    id_serie serii.cod_serie%type;
    nume_carte carti.denumire%type;
    begin
     
        id_librarie := det_librarie(nume_strada);
        id_serie := det_serie(nume_serie);
        
        retin_date := informatii_cerere_serie(id_serie, id_librarie);
              
        DBMS_OUTPUT.PUT_LINE('Pretul comenzii este de '|| retin_date.pret_total);
        
        DBMS_OUTPUT.PUT_LINE('----------------------------');                
        DBMS_OUTPUT.PUT_LINE('Se gasesc cartile: ');
            for i in retin_date.lista_carti_gasite.first..retin_date.lista_carti_gasite.last loop
                select denumire
                into nume_carte
                from carti
                where cod_carte = retin_date.lista_carti_gasite(i);
                
                DBMS_OUTPUT.PUT_LINE(nume_carte);
            end loop;
        
        
        --daca toate cartile din serie se gasesc in librarie, se produce reducerea
        if retin_date.lista_carti_care_nu_se_gasesc.count = 0 then
            DBMS_OUTPUT.PUT_LINE('In librarie se gaseste toata seria. Se aplica reducere de 10%');
            retin_date.pret_total := retin_date.pret_total - 0.1*retin_date.pret_total;
        else
            DBMS_OUTPUT.PUT_LINE('In librarie se gasesc doar '|| retin_date.lista_carti_gasite.count ||
                                ' carti din cele '||retin_date.lista_carti_care_nu_se_gasesc.count||
                                ' ale seriei. Nu se aplica reducerea de 10%.');
                                
            
            DBMS_OUTPUT.PUT_LINE('----------------------------'); 
            DBMS_OUTPUT.PUT_LINE('Nu se gasesc cartile: ');
            for i in retin_date.lista_carti_care_nu_se_gasesc.first..retin_date.lista_carti_care_nu_se_gasesc.last loop
                select denumire
                into nume_carte
                from carti
                where cod_carte = retin_date.lista_carti_care_nu_se_gasesc(i);
        
                DBMS_OUTPUT.PUT_LINE(nume_carte);
                
            end loop;
        end if;
        
        vanzare(id_librarie, retin_date.lista_carti_gasite);  --se produce cumpararea
        DBMS_OUTPUT.PUT_LINE('Asadar pretul final este de '||retin_date.pret_total);  
    end;
end;
/

begin
 -- pachet14.cerere('Anotimpurile inimii', 'Strada Republicii');  --cod_librarie 80; cod_carti: 109, 110, 111, 112
 pachet14.cerere('Cantecul Acadiei', 'Strada Republicii');
 --pachet14.cerere('Cantecul Acadiei', 'Strada Anonima');   --nu exista librarie pe strada aceasra
 --pachet14.cerere('Anonima', 'Strada Republicii');         --nu exista serie de carti cu acest nume in BD
 exception
    when others then
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
end;
/
rollback;
select * from stoc;
select * from bonuri;

