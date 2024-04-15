-- 1.Find crime information

select *
from crime_scene_report
where date = 20180115
    and city = "SQL City"
    and Type = "murder" 


-- 2. Get witness reports 
-- Witness 1: lives in last house “ NorthWestern Dr ” - Morty Schapiro


select *
from person
where address_street_name = "Northwestern Dr"
order by address_number desc 


-- Witness 2: named “ Annabel ”, lives somewhere “ Franklin Ave ” - Annabel Miller

select *
from person
where name like "Annabel%"
    and address_street_name = "Franklin Ave" // 3.Get witness interview transcripts
select *
from interview
where person_ID in (14887, 16371)


-- 3. Get witness transcripts

select *
from interview
where person_ID in (14887, 16371)

--WTN 1 transcript: killer had a 'Get Fit Now Gym Bag' - membership number on bag starts with "48Z", only gold members have this, man got into car with number plate which included "H42W"
--WTN 2: recognised killer from gym where worked out Jan 9th

-- 3. Find Killer

select p.* 
from drivers_license dl
	inner join person P on dl.id = p.license_id
	inner join get_fit_now_member g on p.id = g.person_id
where plate_number Like "%H42W%"

-- killer: Jeremy Bowers


-- Check Killer correct

INSERT INTO solution VALUES (1, 'Jeremy Bowers');
        SELECT value FROM solution;

--7. Find Mastermind
--killer hired by woman with a lot of money
--around 65" or 67", red hair,drives a Tesla Model S 
-- attended SQL Symphony Concert 3x in Dec 2017

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






