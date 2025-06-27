--(1) QUANTOS FILMES HÁ EM PORTUGUES?
select count(*) from film f inner join "language" l
ON l.language_id = f.language_id where l."name" = 'portuguÊs';


--(2) QUANTOS CLIENTES ALUGARAM O FILME DE ID = 7?
select count(*) from customer c
inner join rental r on r.customer_id = c.customer_id 
inner join inventory i on 
r.inventory_id = i.inventory_id 
inner join film f on i.film_id = f.film_id 
where f.film_id = 7;


--(3) QUANTOS ALUGUEIS FORAM FEITOS NO TOTAL?
select count(*) from rental;




--(4) QUAL FOI O CUSTO DO FILME DE ID = 600?
select replacement_cost as "custo de reposição" from film f 
where film_id = 600;



--(5) QUANTOS FUNCIONARIOS TEM EM CADA LOJA?
select a.address, count(*) from staff sta
inner join store sto on
sta.store_id = sto.store_id 
inner join address a on 
a.address_id = sto.address_id 
group by a.address;




--(6) QUAL FUNCIONARIO ALUGOU MAIS FILMES?
select s.first_name, s.last_name from staff s 
join rental r on s.staff_id  = r.staff_id 
group by s.first_name, s.last_name
order (r.rental_id) desc 
limit 1;



--(7) LISTE AS SEGUINTES COLUNAS: TITULO DE FILME, IDIOMA, CUSTO, 
--DATA DO ULTIMO ALUGUEL, NOME DO CLIENTE DO ULTIMO ALUGUEL, 
--FUNCIONARIO QUE ALUGOU , LOJA DO ALUGUEL E PREÇO DE ALUGUEL.
select f.title from film f
join "language" l on l.language_id =f.language_id 
inner join replacement_cost on f.film_id = r.