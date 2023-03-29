/*. Sa se scrie o functie care sa primeasca ca si parametri CNP, si produs sa returneze 
restul de plata. */ 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` FUNCTION `functie8`(fcnp char(13), fprodus varchar(20)) 
RETURNS int DETERMINISTIC
BEGIN

declare fpret integer;		
declare fplata integer;
declare rest integer;

select pret into fpret
from clienti c, achizitii a
where c.cnp=fcnp and fprodus=a.produs and c.cnp=a.cnp
group by pret;

select suma_incasata into fplata 
from clienti c, achizitii a
where c.cnp=fcnp and c.cnp=a.cnp and fprodus=a.produs
group by suma_incasata;

set rest=fpret-fplata;

RETURN rest ;
END $$

DELIMITER ;