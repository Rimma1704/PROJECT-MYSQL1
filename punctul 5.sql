/* Sa se genereze un raport care sa cuprinda numele,prenumele, cnp, si produsele 
achizitionate si achitate integral de catre clienti.*/

select c.nume ,c.prenume,c.cnp,a.produs
from clienti c, achizitii a
where c.cnp=a.cnp and a.pret=a.suma_incasata