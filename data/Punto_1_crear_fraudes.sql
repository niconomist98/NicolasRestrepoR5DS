create table public.fraudes(
Monthh text,	
WeekOfMonth int,
DayOfWeek	text,
Make	text,
AccidentArea    text,	
DayOfWeekClaimed	text,
MonthClaimed	text,
WeekOfMonthClaimed  int,
Sex text,
MaritalStatus   text,	
Age	int,
Fault	text,
PolicyType	text,
VehicleCategory	text,
VehiclePrice	text,
FraudFound_P	int,
PolicyNumber	int,
RepNumber	int,
Deductible	int,
DriverRating	int,
Days_Policy_Accident	text,
Days_Policy_Claim	text,
PastNumberOfClaims	text,
AgeOfVehicle	text,
AgeOfPolicyHolder	text,
PoliceReportFiled	text,
WitnessPresent	text,
AgentType	text,
NumberOfSuppliments	   text,
AddressChange_Claim text,
NumberOfCars	text,
Yearr   int,
BasePolicy  text

)

select * from public.fraudes

COPY public.fraudes FROM 'C:\Program Files\PostgreSQL\15\fraud.csv' DELIMITER ',' CSV header;


