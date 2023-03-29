/*Sa se afiseze clientul care are cele mai multe produse achiztionate dar neplatite 
integral, precizand numele, prenumele, CNP, numar de produse si rata lui de achitare (cat la suta 
a platit din pretul bunurilor achizitionate)*/

set @maxim:= (select max(tmp.nr_produse) from (select c.nume, c.prenume, c.cnp, count(a.produs) as nr_produse,
		(sum(a.pret-a.suma_incasata)/sum(a.pret))*100 as rata
		from clienti c inner join achizitii a using (cnp)
		where a.pret - suma_incasata > 0
		group by c.cnp) as tmp); 
SELECT * FROM (select c.nume, c.prenume, c.cnp, count(a.produs) as nr_produse,
		(sum(a.pret-a.suma_incasata)/sum(a.pret))*100 as rata
		from clienti c inner join achizitii a using (cnp)
		where a.pret - suma_incasata > 0
		group by c.cnp) AS tmp WHERE tmp.nr_produse = @maxim;