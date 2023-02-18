-- Active: 1676723989480@@127.0.0.1@5433@team00@public
select
    coalesce(u.name, 'not defined') as name,
    coalesce(u.lastname, 'not defined') as lastname,
    b.type as type,
    sum(b.money) as volume,
    coalesce(c.name, 'not defined') as currency_name,
    coalesce(c.rate_to_usd, 1) as last_rate_to_usd,
    (sum(b.money) * coalesce(c.rate_to_usd, 1)) as total_volume_in_usd
from balance as b
    full join "user" as u on b.user_id = u.id
    full join currency as c on b.currency_id = c.id
group by(u.name, u.lastname, b.type, c.name, c.rate_to_usd)
order by name desc, lastname asc, type asc;
