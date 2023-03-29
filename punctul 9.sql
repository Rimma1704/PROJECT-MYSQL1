/*Sa se afiseze doar clientii care au minim 4 produse achitate integral, sau au achitionat 
produse a caror valoare totala depaseste 1000, in maxim 2 ani consecutivi precizand: nume, 
prenume, CNP si respectiv suma totala incasata., si care nu au produse achitate partial (Clienti 
majori).*/

select c.nume, c.prenume,a.cnp,a.suma_incasata as total 
from clienti c, achizitii a 
where c.cnp=a.cnp and a.pret-a.suma_incasata=0
group by c.nume,c.prenume,c.cnp
having count(a.produs)>4 or sum(a.suma_incasata)>100 and 
(max(truncate(a.data_achizitie,'yyyy'))-min(truncate(a.data_achizitie,'yyyy'))=1)
order by c.nume;