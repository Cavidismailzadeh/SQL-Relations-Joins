
create table Employees(
[Id] int primary key identity(1,1),
[Name] nvarchar (100),
[Surname] nvarchar (100),
[Age] int,
[Salary] decimal,
[Position] nvarchar(100),
[IsDeleted] bit,
)


create table Countries(
[Id] int primary key identity(1,1),
[Name] nvarchar(100),
)


create table Cities(
[Id] int primary key identity(1,1),
[Name] nvarchar(100),
[CountryId] int foreign key references Countries(Id)
)

INSERT INTO Employees(Name, Surname, Age, Salary, Position, IsDeleted)
VALUES('Anar', 'Aliyev', 27,  2112.80,  'Marketing ',  'false'),
('Elekber', 'Hesenov', 21,  2120.70,  'Director',  'false'),
('Konul', 'Ibrahimli', 27,  1542,  'Manager',  'true'),
('Ali', 'Talibov', 20,  2100,  'Business Analyst',  'true'),
('Cavid', 'Bashirov', 29,  2700.60,  'Software Developer',  'false')




INSERT INTO Countries(Name)
VALUES ('Azerbaycan'),
       ('Turkiye'),
       ('Amerika'),
       ('Ingiltere')


INSERT INTO Cities(Name)
VALUES ('Baku'),
       ('Istanbul'),
       ('New York'),
       ('London'),
	   ('Seki'),
	   ('Lerik')


select * from Countries
select * from Cities
select * from Employees


select Countries.Name, Cities.Name from Countries 
inner join Cities
on Countries.Id = Cities.CountryId


select Employees.Name, Employees.Surname, Countries.Name, Cities.Name from Employees
inner join Cities
on Cities.Id = Employees.CityId
inner join Countries
on Countries.Id = Cities.CountryId


select Employees.Name, Countries.Name from Employees
inner join Cities
on Cities.Id = Employees.CityId
inner join Countries
on Countries.Id = Cities.CountryId
where Employees.Salary>2000



select Employees.Name, Employees.Surname, Employees.Age, Employees.Salary, Employees.Position, Employees.IsDeleted from Employees
where Employees.Position = 'Marketing'


select Employees.Name, Employees.Surname, Countries.Name, Cities.Name from Employees
inner join Cities
on Cities.Id = Employees.CityId
inner join Countries
on Countries.Id = Cities.CountryId
where Employees.IsDeleted = 'true'
