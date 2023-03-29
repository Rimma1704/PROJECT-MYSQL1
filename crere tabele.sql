/* Sa se scrie comenzitle SQL pentru tabelele proctate la punctul anterior */

create table clienti (
nume varchar(15) not null,
prenume varchar(20) not null,
cnp char(13) primary key,
adresa varchar(10) not null,
telefon int(9),
disponibil_in_cont float(8,2)
);								/* creare tabela clienti */

create table achizitii (
cnp char(13),
constraint fk_clienti
foreign key(cnp) references clienti(cnp) on update cascade on delete cascade,
produs varchar(20),
data_achizitie date,
pret float(8,2),
suma_incasata float(8,2)
);							/* creare tabela achizitii */
