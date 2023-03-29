/*vizualizare tabela achiziti si clienit*/

select * from clienti c, achizitii a 
where c.cnp=a.cnp
order by c.nume;