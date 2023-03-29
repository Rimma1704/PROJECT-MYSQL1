/*Sa se genereze un raport detaliat care sa cuprinda numele,prenumele, CNP, si toate 
produsele achizitionate, pretul, si restul de plata, ordonat dupa nume, prenume, data achitiei, 
crescator, respectiv rest de plata descrescator*/

select c.nume,c.prenume,c.cnp,a.produs,a.pret, a.pret-a.suma_incasata as rest_plata
from clienti c, achizitii a
where c.cnp=a.cnp
order by c.nume asc ,c.prenume asc, c.cnp asc, a.data_achizitie asc, rest_plata desc;