--How many stops are in the database.--

SELECT COUNT(id) FROM stops;

--Find the id value for the stop 'Craiglockhart'--

SELECT id FROM stops WHERE name = 'Craiglockhart';

--Give the id and the name for the stops on the '4' 'LRT' service--

SELECT id, name FROM stops JOIN route ON stop=stops.id WHERE num = '4' AND company = 'LRT';

--The query shown gives the number of routes that visit either London Road (149) or Craiglockhart (53). Run the query and notice the two services that link these stops have a count of 2. Add a HAVING clause to restrict the output to these two routes.-

SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) >= 2;

--Execute the self join shown and observe that b.stop gives all the places you can get to from Craiglockhart, without changing routes. Change the query so that it shows the services from Craiglockhart to London Road.--

SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop=149;

--The query shown is similar to the previous one, however by joining two copies of the stops table we can refer to stops by name rather than by number. Change the query so that the services between 'Craiglockhart' and 'London Road' are shown. If you are tired of these places try 'Fairmilehead' against 'Tollcross'-

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='London Road';

--Give a list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith')--

SELECT DISTINCT A.company, A.num FROM route A JOIN route B
ON A.num=B.num
WHERE A.stop = 115 AND B.stop=137;

--Give a list of the services which connect the stops 'Craiglockhart' and 'Tollcross'--

SELECT st.company, st.num FROM route st JOIN route des
ON (st.num=des.num)
JOIN stops a ON a.id=st.stop
JOIN stops b ON b.id=des.stop
WHERE a.name='Craiglockhart' AND b.name='Tollcross';

--Give a distinct list of the stops which may be reached from 'Craiglockhart' by taking one bus, including 'Craiglockhart' itself, offered by the LRT company. Include the company and bus no. of the relevant services.--

SELECT DISTINCT B.name, des.company, des.num 
FROM route str
JOIN route des ON str.num=des.num
JOIN stops A ON A.id=str.stop
JOIN stops B ON B.id=des.stop
WHERE A.name = 'Craiglockhart' AND str.company = 'LRT' AND des.company = 'LRT';

--Find the routes involving two buses that can go from Craiglockhart to Lochend. Show the bus no. and company for the first bus, the name of the stop for the transfer, and the bus no. and company for the second bus.--
-- Incomplete Problem--
SELECT company, num FROM route;