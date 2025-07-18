/* Write your T-SQL query statement below */
select FirstName, LastName, city, state from person left join address 
on person.personId = address.personId 