-- 1
select * from pilots WHERE id in (
	select second_pilot_id from flights
	where destination = "Шереметьево"
		and flight_dt between "2022-08-01" and "2022-08-31"
)

-- 2
select pilots.*
from pilots where id in (
	select first_pilot_id from flights join plains on plains.id = flights.plane_id where plains.cargo_flg = 0 and flights.quantity > 30
	union
	select second_pilot_id from flights join plains on plains.id = flights.plane_id where plains.cargo_flg = 0 and flights.quantity > 30
)


-- 3
select pilots.*
from pilots join flights on flights.first_pilot_id = pilots.id join plains on plains.id = flight.plains_id
where plains.cargo_flg = 1
	and flights.dt between "2022-01-01" and "2022-12-31"
group by pilots.id
order by cnt(*) desc
limit 10;
