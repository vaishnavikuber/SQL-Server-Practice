--------------Built in Funcions--------------

--------string functions------
----ASCII()
select ASCII('A') as 'ascii value'
select ASCII('BC') as 'ascii value' ---gives ascii value of first character
select ASCII('d') as 'ascii value'

----CHAR()---(0-255)
select CHAR(40) 'character'
select CHAR(65) 'character'
select CHAR(115) 'character'
select CHAR(256) 'character' --- gives null

-----CHARINDEX()
select CHARINDEX('d','humpty dumpty') as 'char index'
select CHARINDEX('p','humpty dumpty',5) as 'char index'
select CHARINDEX('of','this is example of character index') as 'char index'
select CHARINDEX('d','humpty') as 'char index'  ---gives 0

-----DIFFERENCE() and SOUNDEX()
select SOUNDEX('5') as soundex1,SOUNDEX('five') as soundex2
select SOUNDEX('5') as soundex1,SOUNDEX('five') as soundex2, DIFFERENCE('5','five') as similarity
select SOUNDEX('23') as soundex1,SOUNDEX('two') as soundex2, DIFFERENCE('23','twentythree') as similarity
select SOUNDEX('doo') as soundex1,SOUNDEX('goo') as soundex2, DIFFERENCE('doo','goo') as similarity

-----LEFT()
select LEFT('This is left function',3) as 'character'
select LEFT('This is left function',7) as 'character'

---LEN()
select LEN('hello world') as 'length'
select LEN('the second example') as 'length'

-----LOWER()
select LOWER('CAR AND BIKE') as 'lower case'
select LOWER('Comming Soon') as 'lower case'
select LOWER('hello hii byEE') as 'lower case'

-----UPPER()
select UPPER('it is beautiful to see sky and stars') as 'upper case'
select UPPER('Seems To Be Good') as 'upper case'
select UPPER('Dog is soo CUTE') as 'upper case'

----LTRIM()
select LTRIM('     hello') as 'trimmed string'
select LTRIM('     Donkey      ') as 'trimmed string'
select LTRIM('Fish swims     ') as 'trimmed string'

----RTRIM()
select RTRIM('     hello') as 'trimmed string'
select RTRIM('Donkey      ') as 'trimmed string'
select RTRIM('     Fish swims     ') as 'trimmed string'

----PATINDEX()
select PATINDEX('%index%','this is the example for pattern index method') as 'occerence'
select PATINDEX('%[^a-z]%','this is the example for pattern index method') as 'occerence'
select PATINDEX('%pa__ern%','this is the example for pattern index method') as 'occerence'

-----REPLACE()
select REPLACE('I am going to chicago','chicago','london')
select REPLACE('the dog flys','flys','barks')
select REPLACE('I was very happy','was','am')

----REPLICATE()
select REPLICATE('hare ram ',4)
select REPLICATE('APPLE ',6)

----REVERSE()
select REVERSE('Ram is in vanavas')
select REVERSE('Ganga')

----SPACE()
select 'Manamohan'+SPACE(20)+'Das';
select 'leo'+SPACE(2)+'chord';

----STR()
select STR(234.56,5,1);
select STR(9.9);

----STUFF()
select STUFF('starting from a to z',1,8,'ending');
select STUFF('Taking the school bag',12,6,'college');

----SUBSTRING()
select SUBSTRING('This is substring',6,2);
select SUBSTRING('This is substring',4,9);

-----FORMAT()
select FORMAT(6578909876,'###-###-####');
select FORMAT(GETDATE(),'dd-MM-yyyy');
DECLARE @Salary INT = 76.9;
SELECT @Salary, FORMAT(@Salary, N'F'), FORMAT(@Salary, N'C', N'en-IN');

----------DATE and TIME FUnctions---------
----CURRENT_TIMESTAMP
select CURRENT_TIMESTAMP;

----DATEADD()
SELECT DATEADD(YEAR, 2, '2025-01-21 16:50:47.234') AS 'DateAdd';
SELECT DATEADD(MONTH, 5, '2025-01-21 16:50:47.234') AS 'DateAdd';
SELECT DATEADD(DAY, 11, '2025-01-21 16:50:47.234') AS 'DateAdd';
SELECT DATEADD(WEEK, 3, '2025-01-21 16:50:47.234') AS 'DateAdd';
SELECT DATEADD(HOUR, 5, '2025-01-21 16:50:47.234') AS 'DateAdd';
SELECT DATEADD(MINUTE, 10, '2025-01-21 16:50:47.234') AS 'DateAdd';
SELECT DATEADD(SECOND, 13, '2025-01-21 16:50:47.234') AS 'DateAdd';
SELECT DATEADD(MILLISECOND, 2345, '2025-01-21 16:50:47.234') AS 'DateAdd';

----DATEDIFF()
select DATEDIFF(YEAR,'2025-01-21','2026-01-21');
select DATEDIFF(MONTH,'2025-01-21','2026-01-21');
select DATEDIFF(DAY,'2025-01-21','2026-01-21');
select DATEDIFF(HOUR,'2025-01-21 01:20','2026-01-21 02:30');

----DATEFROMPARTS()
select DATEFROMPARTS(2025,6,21);










