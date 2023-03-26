create table Educations(
[Id] int primary key identity(1,1),
[Name] nvarchar(255),
[Duration] int
)

create table WeekDays(
[Id] int primary key identity(1,1),
[Name] nvarchar(255),
)

create table Sessions(
[Id] int primary key identity(1,1),
[Name] nvarchar(255)
)

create table Countries(
[Id] int primary key identity(1,1),
[Name] nvarchar(255)
)

create table Cities(
[Id] int primary key identity(1,1),
[Name] nvarchar(255),
[CountryId] int foreign key references Countries(Id)
)

create table Rooms(
[Id] int primary key identity(1,1),
[Name] nvarchar(255),
[Capacity] int,
)

create table WeekDaySeans(
[Id] int primary key identity(1,1),
[WeekDayId] int foreign key references WeekDays(Id),
[SessionId] int foreign key references Sessions(Id)
)

create table Teachers(
[Id] int primary key identity(1,1),
[FullName] nvarchar (255),
[Email] nvarchar (255),
[Address] nvarchar (255),
[Salary] decimal,
[CityId] int foreign key references Cities(Id)
)

create table Groups(
[Id] int primary key identity(1,1),
[Name] nvarchar (255),
[EducationId] int foreign key references Educations(Id),
[RoomId] int foreign key references Rooms(Id),
[WeekDaySeansId] int foreign key references WeekDaySeans(Id)
)

create table Students(
[Id] int primary key identity(1,1),
[FullName] nvarchar (255),
[Birthday] date,
[Address] nvarchar (255),
[CityId] int foreign key references Cities(Id)
)


create table GroupTeachers(
[Id] int primary key identity(1,1),
[GroupId]  int foreign key references Groups(Id),
[TeacherId] int foreign key references Teachers(Id)
)

create table GroupStudents(
[Id] int primary key identity(1,1),
[GroupId]  int foreign key references Groups(Id),
[StudentId] int foreign key references Students(Id)
)

create table StaffMembers(
[Id] int primary key identity(1,1),
[FullName] nvarchar (255),
[Salary] decimal,
[CityId] int foreign key references Cities(Id)
)

create table Roles(
[Id] int primary key identity(1,1),
[Name] nvarchar(255),
)


create table RoleMember(
[Id] int primary key identity(1,1),
[RoleId] int foreign key references Roles(Id),
[MemberId] int foreign key references StaffMembers(Id)
)
