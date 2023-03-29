/* a se scrie un trigger care la adaugarea unei produs, sa calculeze automat disponibilul 
si suma incasata, in conditiile eneutate la punctul 4. */

DELIMITER $$

create trigger tr1
before insert on achizitii 
for each row begin 
declare disponibil int(11);


select disponibil_in_cont into disponibil 
from clienti c
where new.cnp=c.cnp;

if(new.suma_incasata-new.pret)=0 then 
/*select 'S-a realizat cu succes!';*/
SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'Succes';

elseif(disponibil>0) and (new.pret-new.suma_incasata)>0 then 
set new.suma_incasata = disponibil + new.suma_incasata;
update clienti c set disponibil_in_cont=disponibil
where new.cnp=c.cnp;

elseif(disponibil>0) and (new.pret-new.suma_incasata)<0 then 
set new.suma_incasata=disponibil+new.suma_incasata;
update clienti c set disponibil_in_cont=disponibil
where new.cnp=c.cnp;
end if;

if(new.suma_incasata=new.pret)>0 then 
set disponibil =new.suma_incasata-new.pret;
set new.suma_incasata=new.pret;
update clienti c set disponibil_in_cont=disponibil
where new.cnp=c.cnp;
end if;

end $$
