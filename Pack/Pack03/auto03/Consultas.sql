--Easy consultas 
--1
SELECT booking_date,nights
FROM booking
where guest_id = 1183

--2

SELECT arrival_time,first_name,last_name
FROM booking,guest
WHERE booking.guest_id = guest.id and
booking_date = '2016-11-05'
order by arrival_time

-- 3
SELECT booking_id,room_type_requested,occupants,amount
FROM booking,rate
WHERE booking.room_type_requested = rate.room_type and
booking.occupants = rate.occupancy and
booking_id in (5152,5165,51545295)

--4

SELECT first_name,last_name,address
FROM booking,guest
WHERE booking.guest_id = guest.id and booking.booking_date = 
'2016-12-03' and booking.room_no = 101

--5

SELECT guest_id , count(nights),sum(nights) 
FROM booking
WHERE guest_id in (1185,1270)
GROUP BY guest_id

/*
Medium Consultas
--6
*/

SELECT sum(booking.nights*rate.amount)
FROM booking,rate,guest
WHERE booking.guest_id = guest.id and 
    booking.occupants = rate.occupancy and
    booking.room_type_requested = rate.room_type and 
    first_name = 'Ruth' and last_name = 'Cadbury'

--7

SELECT sum((booking.nights * rate.amount) + 
(select sum(amount)from extra where booking_id = 5346))
FROM rate, booking
WHERE booking.room_type_requested = rate.room_type and 
booking.occupants = rate.occupancy and booking.booking_id = 5346

--8
SELECT g.first_name,g.last_name,g.address
FROM booking b  right join guest g on (b.guest_id=g.id)
WHERE g.address like('%Edinburgh%')
ORDER BY g.last_name

/*-9

SELECT booking_date,count(booking_id)
FROM booking
WHERE booking_date >= '2016-11-25' and 
booking_date <= '2016-12-01'
GROUP BY booking_date
*/
 -- 10
 SELECT sum(b.occupants )
 FROM booking b left join guest g on b.guest_id = g.id
 WHERE b.booking_date = '2016-11-21'
 