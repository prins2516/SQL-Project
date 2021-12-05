--Problem 1: How can you retrieve all the information from the cd.facilities table?
select * from cd.facilities;
--by calling * from facilities table we can retrive all infromation of table

--Problem 2: You want to print out a list of all of the facilities and their cost to members. 
--How would you retrieve a list of only facility names and costs?
select name,membercost from cd.facilities;
-- we are selecting only names and cost of members from facility table

--Problem 3:How can you produce a list of facilities that charge a fee to members?
select * from cd.facilities where membercost >0;
-- so we only have to select * and membercost which is larger than zero

--Problem 4:How can you produce a list of facilities that charge a fee to members, and that fee
--is less than 1/50th of the monthly maintenance cost? Return the facid, facility name, member cost,
--and monthly maintenance of the facilities in question.
select facid,name,membercost,monthlymaintenance from cd.facilities 
where membercost < (monthlymaintenance)/50 and membercost>0;
--so we are selecting only those facid and names where after dividing monthly maintenance by 50 
--is  larger than membercost

--Problem 5:How can you produce a list of all facilities with the word 'Tennis' in their name?
select * from cd.facilities where  name like '%Tennis%';
-- here selecting only those rows which has name tennis by like operator

--Problem 6:How can you retrieve the details of facilities with ID 1 and 5? Try to do it without
--using the OR operator.
select * from cd.facilities where facid in (1,5);
-- here we selecting everything from facility table facid either 1 or 5 with the in operator

--Problem 7:How can you produce a list of members who joined after the start of September 2012? 
--Return the memid,surname, firstname, and joindate of the members in question.
select memid,surname,firstname,joindate from cd.members where joindate > '2012-09-01';
-- so we have to select all required columns from member table where joining of members 
--after '2012-09-01' to do that we are using > logical operator

--Problem 8:How can you produce an ordered list of the first 10 surnames in the members table? The
--list must not contain duplicates.
select distinct surname from cd.members order by surname limit 10;
--using distint in surname to get diffrent names and limitin names to 10

--Problem 9:You'd like to get the signup date of your last member. How can you retrieve this information?
select max(joindate) as latest_join from cd.members;
--select maximum date is high for last member as he signup in last

--Problem 10:Produce a count of the number of facilities that have a cost to guests of 10 or more.
select count(*) from cd.facilities where guestcost >=10;
--count every row from table facilities where guestcost more than 10 with logical operator

--Problem 11:Produce a list of the total number of slots booked per facility in the month of September 2012. 
--Produce an output table consisting of facility id and slots, sorted by the number of slots.
select facid, sum(bookings.slots) as TotalSlots from cd.bookings
where starttime between '2012-09-01' and '2012-10-1'
group by facid order by (TotalSlots);


--Problem 12:Produce a list of facilities with more than 1000 slots booked. Produce an output table 
--consisting of facility id and total slots, sorted by facility id.
select facid,sum(slots)as total_slots from cd.bookings group by facid
having sum(slots) > 1000 order by facid;
--here we suming slots and grouping on facid and to select we using having function 
-- to know which has sum more than 1000 and ordering in ascending 

--Problem 13:How can you produce a list of the start times for bookings for tennis courts, for the 
--date '2012-09-21'? Return a list of start time and facility name pairings, ordered by the time.
select starttime as start,name from cd.bookings inner join cd.facilities on bookings.facid=
facilities.facid where starttime between '2012-09-21 00:00:00' and '2012-09-21 23:59:59' 
and name like '%Tennis Court%'order by starttime;
--to select name and time we are joining to tables booking and  facilitites on facid and
--we are using between for time 24 hr just to select only date 2012-09-21

--Problem14:How can you produce a list of the start times for bookings by members named 'David Farrell'?
select starttime from cd.bookings inner join cd.members on cd.members.memid = cd.bookings.memid
where surname like '%Farrell%' and firstname like '%David%';
--selecting only those members from booking table who has name david farrell and using inner join to merge
--booking and member tables on memid


