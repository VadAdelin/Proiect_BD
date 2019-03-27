DROP TABLE Utilizatori CASCADE CONSTRAINTS
/
DROP TABLE PlaciVideo CASCADE CONSTRAINTS
/
DROP TABLE Procesoare CASCADE CONSTRAINTS
/
DROP TABLE PlaciDeBaza CASCADE CONSTRAINTS
/
DROP TABLE HardDiskuri CASCADE CONSTRAINTS
/
DROP TABLE Carcase CASCADE CONSTRAINTS
/
DROP TABLE Surse CASCADE CONSTRAINTS
/
DROP TABLE Monitoare CASCADE CONSTRAINTS
/
DROP TABLE Tastaturi CASCADE CONSTRAINTS
/
DROP TABLE Mouse CASCADE CONSTRAINTS
/
DROP TABLE Tranzactie CASCADE CONSTRAINTS
/

CREATE TABLE Utilizatori (
user_id VARCHAR2(100) NOT NULL PRIMARY KEY,
username VARCHAR2(20) NOT NULL,
parola VARCHAR2(20) NOT NULL,
email VARCHAR2(30) NOT NULL,
nume VARCHAR2(20) NOT NULL,
phone_number NUMBER(10) NOT NULL,
data_nastere DATE,
judet VARCHAR2(20) NOT NULL,
oras VARCHAR2(20) NOT NULL,
admin_rights NUMBER(1)
)
/

CREATE TABLE PlaciVideo (
id_produs VARCHAR2(100) NOT NULL PRIMARY KEY,
nume VARCHAR2(100),
data_lansarii DATE NOT NULL,
memorie VARCHAR(10) NOT NULL,
tip_memorie VARCHAR(10) NOT NULL,
frecventa VARCHAR(10) NOT NULL,
pret INT NOT NULL,
stoc NUMBER(3)
)
/

CREATE TABLE Procesoare (
id_produs VARCHAR2(100) NOT NULL PRIMARY KEY,
memorie_cache varchar(10) NOT NULL,
socket VARCHAR(255) NOT NULL,
frecventa VARCHAR(10) NOT NULL,
arhitectura NUMBER(4) NOT NULL,
nr_nuclee NUMBER(2) NOT NULL,
pret NUMBER(5) NOT NULL,
stoc NUMBER(3)
)
/

CREATE TABLE PlaciDeBaza(
id_produs VARCHAR2(100) NOT NULL PRIMARY KEY,
tip_memorie VARCHAR2(4) NOT NULL,
memorie NUMBER(2) NOT NULL,
porturi_usb NUMBER(3) NOT NULL,
pret NUMBER(5) NOT NULL,
stoc NUMBER(3),
nume VARCHAR2(40)
)
/

CREATE TABLE HardDiskuri (
id_produs VARCHAR2(100) NOT NULL PRIMARY KEY,
capacitate VARCHAR(10) NOT NULL,
viteza_rotatii VARCHAR(10) NOT NULL,
buffer VARCHAR(10),
pret NUMBER(5) NOT NULL,
stoc NUMBER(3),
nume VARCHAR2(40)
)
/

CREATE TABLE Carcase (
id_produs VARCHAR2(100) NOT NULL PRIMARY KEY,
ventilatoare VARCHAR(2) NOT NULL,
deschidere_laterala VARCHAR(2) NOT NULL,
numar_sloturi NUMBER(1) NOT NULL,
dimensiune_WxHxD VARCHAR(30),
pret NUMBER(5) NOT NULL,
stoc NUMBER(3),
nume VARCHAR2(60)
)
/

CREATE TABLE Surse (
id_produs VARCHAR2(100) NOT NULL PRIMARY KEY,
putere_sursa VARCHAR(10) NOT NULL,
ventilatoare NUMERIC(1) NOT NULL,
alimentare VARCHAR(10) NOT NULL,
pret NUMBER(5) NOT NULL,
stoc NUMBER(3),
nume VARCHAR2(40)
)
/

CREATE TABLE Monitoare (
id_produs VARCHAR2(100) NOT NULL PRIMARY KEY,
diagonala VARCHAR(10) NOT NULL,
tehnologie VARCHAR2(3) NOT NULL,
rezolutie_x NUMBER(6) NOT NULL,
rezolutie_y NUMBER(6) NOT NULL,
milioane_culori NUMBER(6) NOT NULL,
conectivitate VARCHAR2(10),
pret NUMBER(5) NOT NULL,
stoc NUMBER(3),
nume VARCHAR2(40)
)
/

CREATE TABLE Tastaturi (
id_produs VARCHAR2(100) NOT NULL PRIMARY KEY,
tip VARCHAR(6) NOT NULL,
iluminare VARCHAR(2) NOT NULL,
tehnologie VARCHAR(8) NOT NULL,
pret NUMBER(5) NOT NULL,
stoc NUMBER(3),
nume VARCHAR2(40)
)
/

CREATE TABLE Mouse (
id_produs VARCHAR2(100) NOT NULL PRIMARY KEY,
tip VARCHAR(6) NOT NULL,
rezolutie VARCHAR2(10) NOT NULL,
tehnologie VARCHAR(8) NOT NULL,
pret NUMBER(5) NOT NULL,
stoc NUMBER(3),
nume VARCHAR2(40)
)
/

CREATE TABLE Tranzactie (
id INT NOT NULL PRIMARY KEY,
user_id INT NOT NULL,
valoare INT NOT NULL,
data_efectuare DATE,
pret NUMBER(5) NOT NULL
)
/

SET SERVEROUTPUt ON;
DECLARE
TYPE varr IS VARRAY(1000) OF varchar2(255);
lista_placivideo varr:= varr('Nvidia GeForce GTX 1060','AMD Radeon RX 580','Nvidia GeForce GTX 1660','AMD Radeon RX 590','Nvidia GeForce GTX 1660 Ti','Nvidia GeForce GTX 1070','Nvidia Titan RTX','Nvidia GeForce RTX 2080 Ti','Nvidia GeForce Titan V','Nvidia GeForce Titan Xp','Nvidia GeForce GTX 1080 Ti','Nvidia GeForce RTX 2080','AMD Radeon VII','Nvidia GeForce RTX 2070','Nvidia GeForce GTX 1080','AMD Radeon RX Vega 64','Nvidia GeForce GTX 1070 Ti','AMD Radeon RX Vega 56','Nvidia GeForce RTX 2060');

v_id VARCHAR(13);
v_denumire_placivideo VARCHAR(255);
v_data_lansare DATE;
v_memorie VARCHAR(10);
v_tipmemorie VARCHAR(20);
v_frecventa VARCHAR(20);
v_pret INT;
v_stocdisponibil INT;
v_porturi NUMBER(3);
v_ventilatoare NUMbER(3);
v_deschidere VARCHAR(5);
v_arhitectura NUMBER(4);
v_numar_nuclee Number(2);
v_sloturi NUMBER(2);
v_dimensiune VARCHAR(30);
v_tip VARCHAR(10);
v_rezolutie VARCHAR(30);
v_tehnologie VARCHAR(10);
v_numar_culori NUMBER(3);
v_conectivitate VARCHAR(10);
v_rezolutie_x NUMBER(6);
v_rezolutie_y NUMBER(6);
v_diagonala NUMBER(4);
v_iluminare VARCHAR(10);

lista_procesoare varr:= varr('Intel Core i3 ','Intel Core i5 ','Intel Core i7 ','Intel Core i9 ','Intel Core Kaby Lake i3 ','Intel Core Kaby Lake i5 ','Intel Core Kaby Lake i7 ','Intel Core Kaby Lake i9 ','Pentium 3 ','Pentium 5 ','AMD Ryzen X1 ','AMD Radeon Vega X1 ','AMD Ryzen X3 ','AMD Radeon Vega X3','AMD Ryzen X5 ','AMD Radeon Vega X5 ','AMD Ryzen X7 ','AMD Radeon Vega X7 ','AMD Athlon X1 ','AMD Athlon X1 ');
v_socket VARCHAR(100);

lista_hard varr:= varr('Seagate Ironwolf x1','Seagate Ironwolf x2','Seagate Ironwolf x3','Seagate Ironwolf x4','Seagate Ironwolf x5','Toshiba DT01','Toshiba DT03','Toshiba DT05','Seagate Skyhawk Surveillance x1','Seagate Skyhawk Surveillance x5','Western Digital WD1','Western Digital WD2','Western Digital WD3','Western Digital WD4','Western Digital WD5','Intel Optane 905P Series','Intel Optane 805P Series','Intel Optane 705P Series','Intel Optane 605P Series','Intel Optane 505P Series');
v_nume VARCHAR(255);

lista_placibaza varr:= varr('ASROCK H370M PRO4','ASUS ROG STRIX Z370-G GAMING','ASUS X99 Rampage V Extreme','ASRock Z97 Extreme6','MSI Z97 Gaming 5','ASUS Maximus VII Hero','ASUS M5A99FX Pro R2','Gigabyte Ga-h97-d3h','MSI A88X-G4 Gaming ','MSI AM1I');
v_denumire_placabaza VARCHAR(100);

lista_carcase varr:= varr('Intertech Jazovo','Floston RED FIRE','Segotep LUX II','Genesis Irid 300','Thermaltake Versa C22','RPC AA000BF','Deepcool MATREXX55','Segotep Baymini, mATX',' Genesis Titan 750','nJoy Santinel','Segotep SG-TG Green, Aluminium mATX','Myria MY8731WH','Segotep Racing, ATX ');
v_denumire_carcasa VARCHAR(100);


lista_surse varr:= varr('nJoy Titan 600','nJoy Titan 700','nJoy Titan 800','nJoy Titan 900','nJoy Titan 500','Corsair VS Series VS550','Corsair VS Series VS650','Corsair VS Series VS750','Corsair VS Series VS850','Corsair VS Series VS950','Sirtec Simplicity Series S1','Sirtec Simplicity Series S2','Sirtec Simplicity Series S3','Sirtec Simplicity Series S4','Sirtec Simplicity Series S5','Gigabyte G550H','Gigabyte G650H','Gigabyte G750H','Gigabyte G850H','Gigabyte G950H');

lista_mouse varr:= varr('Trust GXT 130','Redragon Inquisitor RGB','Razer Mamba','Serioux Trakker OP70',' ASUS WT425',' Marvo M316','ARC Touch','TEHSINO MS-270ORWL','SteelSeries Rival 110','Akyta AM-3802','Logitech Proteus Spectrum','Logitech M185','Logitech MX Master 2S');

lista_monitoare varr:= varr('Samsung','Lenovo','Gigabyte','Dell','BenQ');

lista_tastaturi varr:= varr('Razer Ornata Chroma','Marvo CM370','Marvo CMS350','Marvo CM540','Marvo CMS390','Fury Thunderstreak','Redragon S101-BA','Gembird GGS-UMG4','Gembird GGS-UMG3','Gembird GGS-UMG2','Gembird GGS-UMG5');


BEGIN
FOR v_i IN 1..1000 LOOP
v_id:=FLOOR(DBMS_RANDOM.VALUE(100,999)) || CHR(FLOOR(DBMS_RANDOM.VALUE(65,91))) || CHR(FLOOR(DBMS_RANDOM.VALUE(65,91))) || FLOOR(DBMS_RANDOM.VALUE(0,9));
v_denumire_placivideo := lista_placivideo(TRUNC(DBMS_RANDOM.VALUE(0,lista_placivideo.count))+1);
v_denumire_placivideo:= v_denumire_placivideo ||' V.'|| v_i;
v_data_lansare := TO_DATE('01-01-2002','MM-DD-YYYY')+TRUNC(DBMS_RANDOM.VALUE(365,7000));
v_memorie:=TRUNC(DBMS_RANDOM.VALUE(3,9))||'GB';
v_tipmemorie:='DDR'||TRUNC(DBMS_RANDOM.VALUE(1,6));
v_frecventa:=TRUNC(DBMS_RANDOM.VALUE(1250,1500))||'(MHz)';
v_pret:=TRUNC(DBMS_RANDOM.VALUE(890,1500));
v_stocdisponibil:=TRUNC(DBMS_RANDOM.VALUE(0,40));
insert into PlaciVideo (id_produs,nume,data_lansarii,memorie,tip_memorie,frecventa,pret,stoc) 
values (v_id,v_denumire_placivideo,v_data_lansare,v_memorie,v_tipmemorie,v_frecventa,v_pret,v_stocdisponibil);
END LOOP;


FOR v_i IN 1..1000 LOOP
v_id:=FLOOR(DBMS_RANDOM.VALUE(100,999)) || CHR(FLOOR(DBMS_RANDOM.VALUE(65,91))) || CHR(FLOOR(DBMS_RANDOM.VALUE(65,91))) || FLOOR(DBMS_RANDOM.VALUE(0,9));
v_socket := lista_procesoare(TRUNC(DBMS_RANDOM.VALUE(0,lista_procesoare.count))+1);
v_socket:= v_socket ||'V'|| v_i;

v_memorie:=TRUNC(DBMS_RANDOM.VALUE(1,30))||'MB';
v_frecventa:=TRUNC(DBMS_RANDOM.VALUE(1250,1500))||'(MHz)';
v_pret:=TRUNC(DBMS_RANDOM.VALUE(890,1500));
v_stocdisponibil:=TRUNC(DBMS_RANDOM.VALUE(0,40));
IF(MOD(v_i,2)=0) then
v_arhitectura:= 32;
else
v_arhitectura:=64;
end if;
v_numar_nuclee:=TRUNC(DBMS_RANDOM.VALUE(1,10));

insert into Procesoare (id_produs,memorie_cache,socket,frecventa,arhitectura,nr_nuclee,pret,stoc) 
values (v_id,v_memorie,v_socket,v_frecventa,v_arhitectura,v_numar_nuclee,v_pret,v_stocdisponibil);
END LOOP;



FOR v_i IN 1..1000 LOOP
v_id:=FLOOR(DBMS_RANDOM.VALUE(100,999)) || CHR(FLOOR(DBMS_RANDOM.VALUE(65,91))) || CHR(FLOOR(DBMS_RANDOM.VALUE(65,91))) || FLOOR(DBMS_RANDOM.VALUE(0,9));
v_nume := lista_hard(TRUNC(DBMS_RANDOM.VALUE(0,lista_hard.count))+1);
v_nume:= v_nume ||' V'|| v_i;

v_memorie:=TRUNC(DBMS_RANDOM.VALUE(500,3500))||'GB';
v_frecventa:=TRUNC(DBMS_RANDOM.VALUE(1250,1500))||'(MHz)';
v_pret:=TRUNC(DBMS_RANDOM.VALUE(390,1500));
v_stocdisponibil:=TRUNC(DBMS_RANDOM.VALUE(0,40));

IF(MOD(v_i,2)=0) then
v_arhitectura:= 32;
else
v_arhitectura:=64;
end if;

insert into HardDiskuri (id_produs,capacitate,nume,viteza_rotatii,buffer,pret,stoc) values (v_id,v_memorie,v_nume,v_frecventa,v_arhitectura,v_pret,v_stocdisponibil);
END LOOP;


FOR v_i IN 1..1000 LOOP
v_id:=FLOOR(DBMS_RANDOM.VALUE(100,999)) || CHR(FLOOR(DBMS_RANDOM.VALUE(65,91))) || CHR(FLOOR(DBMS_RANDOM.VALUE(65,91))) || FLOOR(DBMS_RANDOM.VALUE(0,9));
v_denumire_placabaza:=lista_placibaza(TRUNC(DBMS_RANDOM.VALUE(0,lista_placibaza.count))+1);
v_denumire_placabaza:= ' '||v_denumire_placabaza ||'HDv'|| v_i;
v_tipmemorie:='DDR'||TRUNC(DBMS_RANDOM.VALUE(1,6));
IF(MOD(v_i,2)=0) then
v_memorie:= 32;
else
v_memorie:=64;
end if;
v_porturi:=TRUNC(DBMS_RANDOM.VALUE(4,8));
v_pret:=TRUNC(DBMS_RANDOM.VALUE(990,2100));
v_stocdisponibil:=TRUNC(DBMS_RANDOM.VALUE(0,12));
insert into PlaciDeBaza (id_produs,nume,memorie, tip_memorie, porturi_usb, pret, stoc) 
values(v_id, v_denumire_placabaza, v_memorie, v_tipmemorie, v_porturi, v_pret, v_stocdisponibil);
END LOOP;

FOR v_i IN 1..1000 LOOP
v_id:=FLOOR(DBMS_RANDOM.VALUE(100,999)) || CHR(FLOOR(DBMS_RANDOM.VALUE(65,91))) || CHR(FLOOR(DBMS_RANDOM.VALUE(65,91))) || FLOOR(DBMS_RANDOM.VALUE(0,9));
v_denumire_carcasa:=lista_carcase(TRUNC(DBMS_RANDOM.VALUE(0,lista_carcase.count))+1);
v_denumire_carcasa:= ' '||v_denumire_carcasa ||'V'|| v_i;
v_ventilatoare:=TRUNC(DBMS_RANDOM.VALUE(1,3));
IF(MOD(v_i,2)=0) then
v_deschidere:= 'DA';
else
v_deschidere:='NU';
end if;
v_sloturi:=TRUNC(DBMS_RANDOM.VALUE(6,10));
v_dimensiune:=TRUNC(DBMS_RANDOM.VALUE(180,200))||'x'||TRUNC(DBMS_RANDOM.VALUE(380,410))||'x'||TRUNC(DBMS_RANDOM.VALUE(390,440));
v_pret:=TRUNC(DBMS_RANDOM.VALUE(100,560));
v_stocdisponibil:=TRUNC(DBMS_RANDOM.VALUE(1,9));
insert into Carcase (id_produs,nume,ventilatoare,deschidere_laterala,numar_sloturi,dimensiune_WxHxD,stoc,pret)
values (v_id,v_denumire_carcasa,v_ventilatoare,v_deschidere,v_sloturi,v_dimensiune,v_stocdisponibil,v_pret);
END LOOP;



FOR v_i IN 1..1000 LOOP
v_id:=FLOOR(DBMS_RANDOM.VALUE(100,999)) || CHR(FLOOR(DBMS_RANDOM.VALUE(65,91))) || CHR(FLOOR(DBMS_RANDOM.VALUE(65,91))) || FLOOR(DBMS_RANDOM.VALUE(0,9));
v_nume := lista_surse(TRUNC(DBMS_RANDOM.VALUE(0,lista_surse.count))+1);
v_nume:= v_nume ||' V'|| v_i;

v_memorie:=TRUNC(DBMS_RANDOM.VALUE(200,1500))||'W';
v_frecventa:=TRUNC(DBMS_RANDOM.VALUE(200,320))||'(V)';
v_arhitectura:=TRUNC(DBMS_RANDOM.VALUE(0,9));

v_pret:=TRUNC(DBMS_RANDOM.VALUE(50,1000));
v_stocdisponibil:=TRUNC(DBMS_RANDOM.VALUE(0,40));

insert into Surse (id_produs,putere_sursa,nume,alimentare,ventilatoare,pret,stoc) values (v_id,v_memorie,v_nume,v_frecventa,v_arhitectura,v_pret,v_stocdisponibil);
END LOOP;

FOR v_i IN 1..1000 LOOP
v_id:=FLOOR(DBMS_RANDOM.VALUE(100,999)) || CHR(FLOOR(DBMS_RANDOM.VALUE(65,91))) || CHR(FLOOR(DBMS_RANDOM.VALUE(65,91))) || FLOOR(DBMS_RANDOM.VALUE(0,9));
v_nume := lista_mouse(TRUNC(DBMS_RANDOM.VALUE(0,lista_mouse.count))+1);
v_nume:= v_nume ||' V'|| v_i;
IF(MOD(v_i,2)=0) then
v_tip:= 'Usual';
else
v_tip:='Gaming';
end if;
IF(MOD(v_i,3)=0) then
v_tehnologie:= 'Fir';
else
v_tehnologie:='Wireless';
end if;
v_rezolutie:=TRUNC(DBMS_RANDOM.VALUE(2300,4000))||' dpi';
v_pret:=TRUNC(DBMS_RANDOM.VALUE(50,300));
v_stocdisponibil:=TRUNC(DBMS_RANDOM.VALUE(5,49));
insert into Mouse(id_produs,nume,tip,rezolutie,tehnologie,pret,stoc)
values (v_id,v_nume,v_tip,v_rezolutie,v_tehnologie,v_pret,v_stocdisponibil);
END LOOP;

FOR v_i IN 1..1000 LOOP
v_id:=FLOOR(DBMS_RANDOM.VALUE(100,999)) || CHR(FLOOR(DBMS_RANDOM.VALUE(65,91))) || CHR(FLOOR(DBMS_RANDOM.VALUE(65,91))) || FLOOR(DBMS_RANDOM.VALUE(0,9));
v_nume := lista_monitoare(TRUNC(DBMS_RANDOM.VALUE(0,lista_monitoare.count))+1);
v_nume:= v_nume ||' S'|| v_i;

v_diagonala:=TRUNC(DBMS_RANDOM.VALUE(20,200));
v_rezolutie_x:=TRUNC(DBMS_RANDOM.VALUE(400,2500));
v_rezolutie_y:=TRUNC(DBMS_RANDOM.VALUE(4000,2500));
v_numar_culori:=TRUNC(DBMS_RANDOM.VALUE(14,17));

IF(MOD(v_i,2)=0) then
v_tehnologie:='IPS';
else
v_tehnologie:='LED';
end if;


IF(MOD(v_i,3)=0) then
v_conectivitate:='VGA';
else
v_conectivitate:='HDMI';
end if;

v_pret:=TRUNC(DBMS_RANDOM.VALUE(50,1000));
v_stocdisponibil:=TRUNC(DBMS_RANDOM.VALUE(0,40));

insert into Monitoare (id_produs,diagonala,nume,tehnologie,conectivitate,rezolutie_x,rezolutie_y,milioane_culori,pret,stoc) 
values (v_id,v_diagonala,v_nume,v_tehnologie,v_conectivitate,v_rezolutie_x,v_rezolutie_y,v_numar_culori,v_pret,v_stocdisponibil);


END LOOP;
FOR v_i IN 1..1000 LOOP
v_id:=FLOOR(DBMS_RANDOM.VALUE(100,999)) || CHR(FLOOR(DBMS_RANDOM.VALUE(65,91))) || CHR(FLOOR(DBMS_RANDOM.VALUE(65,91))) || FLOOR(DBMS_RANDOM.VALUE(0,9));
v_nume := lista_tastaturi(TRUNC(DBMS_RANDOM.VALUE(0,lista_tastaturi.count))+1);
v_nume:= v_nume ||' V'|| v_i;
IF(MOD(v_i,2)=0) then
v_tip:= 'Usual';
else
v_tip:='Gaming';
end if;
IF(MOD(v_i,3)=0) then
v_tehnologie:= 'Wireless';
else
v_tehnologie:='Fir';
end if;

IF(MOD(v_i,5)=0) then
v_iluminare:= 'DA';
else
v_iluminare:= 'NU';
end if;
v_pret:=TRUNC(DBMS_RANDOM.VALUE(50,300));
v_stocdisponibil:=TRUNC(DBMS_RANDOM.VALUE(5,49));
insert into Tastaturi(id_produs,nume,tip,iluminare,tehnologie,pret,stoc)
values (v_id,v_nume,v_tip,v_iluminare,v_tehnologie,v_pret,v_stocdisponibil);
END LOOP;

END;
/

                                          **TO BE CONTINUED**
