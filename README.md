# Solution-SQL-murder-mystery

![image](https://github.com/hollyjones12/Solution-SQL-murder-mystery/assets/166703171/948f08bf-a1e3-46a3-9718-0e53315ad7f0)




Recently I completed the SQL Murder Mystery hosted by https://mystery.knightlab.com/ created by Joon Park and Cathy He. Link to the original [GitHub Respository](https://github.com/NUKnightLab/sql-mysteries)

This was a really fun way of improving my SQL skills as I've always loved a murder mystery.

The solution I used to complete the challenge is below:

# 1. Get crime details

```
- Murder occurred Jan 15 2018 in SQL City

select *
from crime_scene_report
where date = 20180115
and city = "SQL City"
and Type = "murder"

- 2 witnesses
- 1st witness: lives in last house “NorthWestern Dr” 
- 2nd witness: named “Annabel”, lives somewhere “Franklin Ave”

```

# 2. Get Witness Reports


- 1st witness:
```
select *
from person
where address_street_name = "Northwestern Dr"
order by address_number desc 

= Morty Schapiro
```

- 2nd Witness
```
select *
from person
where name like "Annabel%"
and address_street_name = "Franklin Ave"

= Annabel Miller
```

# 3. Get Witness Interview Transcripts

```
select *
from interview
where person_ID in (14887, 16371)

```
```
1st witness:
- heard gunshot then man running with a "Get Fit Now Gym" bag.
- membership number on bag started with "48Z" - only gold members have those bags
- man got into car with plate number including "H42W"

2nd witness
- show the murder
- recognised kil;ler from gym when working out on Jan 9th
```

# 4. Find the killer

```
select p.* 
	,g.membership_status
	,dl.plate_number
	,check_in_date
from drivers_license dl
	inner join person P on dl.id = p.license_id
	inner join get_fit_now_member g on p.id = g.person_id
	inner join get_fit_now_check_in c on g.id = c.membership_id
where plate_number Like "%H42W%"
and membership_status = "gold"
and check_in_date = 20180109

killer = Jeremy Bowers
```

# 5. Check if correct killer 
```
``INSERT INTO solution VALUES (1, 'Jeremy Bowers');
SELECT value FROM solution;
```
![killer SQL murder mystery](https://github.com/hollyjones12/Solution-SQL-murder-mystery/assets/166703171/7a42204c-3461-4af6-9016-0c844cae9e8e)


# 6. Check Killer transcript

```
select * 
from interview
	where person_id = "67318"

- hired by a woman with a lot of money
- height around 65" or 67"
- Red hair and drives a Tesla Model S
- attended SQL Symphony Concert 3 x in Dec 2017
```

# 7. Find the Mastermind

```
select * 
from drivers_license dl
inner join person p on dl.id = p.license_id
inner join income i on p.ssn = i.ssn
inner join facebook_event_checkin f on f.person_id = p.id
	where hair_color = "red"
	and gender = "female"
	and car_make = "Tesla"
	and car_model = "Model S"
	and height between 65 and 67

= Miranda Priestly
```

# 8. Check correct mastermind

```
INSERT INTO solution VALUES (1, 'Miranda Priestly');
SELECT value FROM solution;
```
![mastermind](https://github.com/hollyjones12/Solution-SQL-murder-mystery/assets/166703171/c1dece31-d24e-4410-b731-6f2f7425655e)

Overall, this was a really interesting way of getting stuck into SQL and improving skills in the data world!



