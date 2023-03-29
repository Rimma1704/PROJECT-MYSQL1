/*4. Să se scrie o procedura care sa permita vanzarea unui produs (La vanzarea unui
produs, se va verifica disponibilul clientului, si acesta va fi adaugat sumei incasate. In cazul in
care suma incasata depaseste valoarea ramasa de achitat, diferenta va fi trecuta in disponibilul
clientului)
- procedura va fi apelata cu parametrii: CNP, nume produs, data, pret, suam incasata */

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `vanzare`(
	in pcnp varchar(13),
    in pnume varchar(20),
    in pdata date,
    in ppret float,
    in psuma float,			/* avem 5 varibile de intrare */
    out disponibil float,
    out suma float,
    out pretul float,
    out x float,
    out y float				/* avem 5 variablie de iesire */
)
begin

insert into achizitii (cnp,produs,data_achizitie,pret, suma_incasata) values (pcnp,pnume,pdata,ppret,ppret);

select ppret into pretul 
from clienti c, achizitii a
where pcnp=c.cnp
group by ppret;

select disponibil_in_cont into disponibil
from clienti c, achizitii a
where pcnp=c.cnp
group by disponibil_in_cont;

select disponibil+psuma into suma
from clienti c,achizitii a 
where pcnp=c.cnp
group by disponibil+psuma;

update clienti c set disponibil_in_cont=0
where pcnp=c.cnp;

select suma-pretul into x
from clienti c
where pcnp=c.cnp
group by pretul-suma;

select pretul-suma into y
from clienti c
where pcnp=c.cnp
group by pretul-suma;

if y<0 then 
update clienti c set disponibil_in_cont=abs(y)
where pcnp=c.cnp;

elseif x>0 then 
update clienti c set disponibil_in_cont=x
where pcnp=c.cnp;
end if;

end $$

DELIMITER ;
