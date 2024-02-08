-- project HR DATA ANALYTICS
-- Problem Statement 1: "Identify Factors Influencing Employee Attrition
select * from hr_data;
/* starts with cleaning of data
colums to fix
1. gender Male = 'M'
Female  = 'F'
2. Department 
Data Scientist = 'DataScientist'
Marketing Analyst = 'Marketinganalyst'
3. last promotion date = date need to fix into yyyy-mm-dd format.
*/

create table Modified_HRDATA as 
select
	EmployeeID,
	age,
	case
		when age < 30 then 'under 30'
		when age between 30 and 40 then 'b/w 30 & 40'
		else 'above 40'
	end as New_age,
	replace(replace(gender,'Male','M'),'Female','F') as gender,
	department,
	replace(replace(position,'DataScientist','Data Scientist'),'Marketinganalyst','Marketing Analyst') as position,
	yearsofservice,
	case
		when yearsofservice <=3 then 'below 3yrs '
		when yearsofservice between 3 and 6 then 'b/w 4-6 yrs'
		when yearsofservice between 6 and 9 then 'b/w 7-9 yrs'
		else 'above 9 yrs'
	end as New_yearsofservice,
	Salary,
	case
		when Salary <=50000 then 'below 50K '
		when Salary between 50000 and 60000 then '50-60K'
		when Salary between 60000 and 70000 then '60-70K'
		when Salary between 70000 and 80000 then '70-80K'
		when Salary between 80000 and 90000 then '80-90K'
		else 'above 90K'
	end as New_Salary,
	PerformanceRating,
	WorkHours, 
	Attrition, 
	Promotion, 
	TrainingHours, 
	SatisfactionScore,
    lastpromotiondate
    from hr_data;
    
alter table modified_hrdata
change column New_age Age_bucket varchar(20),
change column New_Salary Salary_bucket varchar(20),
change column New_yearsofservice Service_bucket varchar(20);
/*    
with newtab_formatted_date as (
select *, date_format(ifnull(str_to_date(lastpromotiondate,'%d-%m-%Y'),lastpromotiondate),'%Y-%m-%d') as formatted_date 
from modified_hrdata)
select * from newtab_formatted_date;
*/

-- 1. basic avg details of data
select count(*),
-- count(case when attrition = 'Yes' then 1 end) as Attrition_count_Yes,
-- count(case when attrition = 'No' then 1 end) as Attrition_count_No,
round(((count(case when attrition = 'Yes' then 1 end)*100)/count(*)),2) as Attritionrate_yes,
round(((count(case when attrition = 'No' then 1 end)*100)/count(Attrition)),2) as Attritionrate_No,
round(avg(age),0) as avg_age,
round(avg(yearsofservice),0) as avg_yrsofservice,
round(avg(salary),0) as avg_salary,
round(avg(performancerating),0) as avg_perfrating,
round(avg(workhours),0) as avg_workhours,
round(avg(traininghours),0) as avg_traininghours,
round(avg(SatisfactionScore),0) as avg_satisfactionscore from modified_hrdata
-- where attrition = 'Yes'
where attrition = 'No';

-- 2. avg attrition rate gender wise
select gender, count(Attrition),
count(case when attrition = 'Yes' then 1 end) as Attrition_count_Yes,
count(case when attrition = 'No' then 1 end) as Attrition_count_No,
round(((count(case when attrition = 'Yes' then 1 end)*100)/count(Attrition)),2) as Attritionrate_yes,
round(((count(case when attrition = 'No' then 1 end)*100)/count(Attrition)),2) as Attritionrate_No from modified_hrdata
group by gender;


-- 3. Department VS attrition rate & promotion rate
SELECT department, -- position,
count(case when attrition = 'Yes' then 1 end) as Attrition_count_Yes,
count(case when attrition = 'No' then 1 end) as Attrition_count_No,
round(((count(case when attrition = 'Yes' then 1 end)*100)/count(*)),2) as Attritionrate_yes,
round(((count(case when attrition = 'No' then 1 end)*100)/count(*)),2) as Attritionrate_No,
round(((count(case when promotion = 'No' then 1 end)*100)/count(*)),2) as promotionrate_No,
round(((count(case when promotion = 'Yes' then 1 end)*100)/count(*)),2) as promotionrate_yes
from modified_hrdata
group by department
order by department, Attritionrate_yes desc, promotionrate_No desc;

/* 4 & 5. sevice bucket/salary_bucket vs Attrition rate, promotion rate, avg_performancerating,
 avg_satisfaction score, avg_workhours & training hours */
SELECT service_bucket, 
-- Salary_bucket,
-- count(case when attrition = 'Yes' then 1 end) as Attrition_count_Yes,
-- count(case when attrition = 'No' then 1 end) as Attrition_count_No,
round(((count(case when attrition = 'Yes' then 1 end)*100)/count(Attrition)),2) as Attritionrate_yes,
round(((count(case when attrition = 'No' then 1 end)*100)/count(Attrition)),2) as Attritionrate_No,
round(((count(case when promotion = 'No' then 1 end)*100)/count(*)),2) as promotionrate_No,
round(((count(case when promotion = 'Yes' then 1 end)*100)/count(*)),2) as promotionrate_yes,
round(avg(workhours),0) as avg_workhours, 
round(avg(TrainingHours),0) as avg_TrainingHours,
round(avg(performancerating),0) as avg_performancerating,
round(avg(satisfactionscore),0) as avg_satisfactionscore
from modified_hrdata
group by service_bucket
-- salary_bucket
order by Attritionrate_yes desc;


-- 6. position vs attritionrate, service_bucket, avg salary, workhours, training hrs, promotion rate

select position, department, service_bucket,
count(case when attrition = 'Yes' then 1 end) as Attrition_count_Yes,
count(case when attrition = 'No' then 1 end) as Attrition_count_No,
(round(((count(case when attrition = 'Yes' then 1 end)*100)/count(*)),2)) as Attritionrate_yes,
-- round(((count(case when attrition = 'No' then 1 end)*100)/count(Attrition)),2) as Attritionrate_No
round(avg(salary),0) as avg_salary, 
round(avg(workhours),0) as avg_workhours, 
round(avg(TrainingHours),0) as avg_TrainingHours,
-- round(avg(performancerating),0) as avg_performancerating,
-- round(avg(satisfactionscore),0) as avg_satisfactionscore,
-- round(((count(case when promotion = 'Yes' then 1 end)*100)/count(*)),2) as Promoted
round(((count(case when promotion = 'No' then 1 end)*100)/count(*)),2) as Not_Promoted
from modified_hrdata
group by position, department, service_bucket
having Attritionrate_yes > 0
order by department; -- Attritionrate_yes desc;


-- Assignment 2:  Optimize Employee Training Programs
/* 1. FINDING RELATION B/W ATTRITION,Promotion & TRAINING HOURS 
2. Relation b/w Gender, age and training hours:
3. Relation b/w work hours & training hours with attrition yes & no:
4. Service bucket vs training hours with avg_workhours:
5. Position vs training hours, performance rate, satisfaction score, working hours & promotion 
*/

/* to understand more on training hours, it was categorised as shown below 
alter table modified_hrdata
drop column Traininghours_bucket; */

Alter Table modified_hrdata
Add Column Traininghours_bucket VARCHAR(20) GENERATED ALWAYS AS (
    CASE
        WHEN Traininghours <=15 THEN 'b/w 10-15 hrs'
        WHEN Traininghours BETWEEN 15 AND 20 THEN 'b/w 16-20 hrs'
        ELSE 'above 20 hrs'
    END
) STORED;

select * from modified_hrdata;
select Traininghours_bucket, count(*) from  modified_hrdata
group by Traininghours_bucket;

-- 1. FINDING RELATION B/W ATTRITION RATE, prommotion & TRAINING HOURS

select Traininghours_bucket,
count(case when attrition = 'Yes' then 1 end) as Emp_left,
count(case when attrition = 'No' then 0 end) as Emp_retained,
count(case when promotion = 'Yes' then 1 end) as Promoted,
count(case when promotion = 'No' then 0 end) as Not_promoted,
round(avg(performancerating),0) as avg_perfrating
from modified_hrdata
group by Traininghours_bucket
order by Traininghours_bucket;

-- 2. gender,age vs TRAINING HOURS 
select Traininghours_bucket, Age_bucket,count(*),
count(case when gender = 'M' then 1 end) as count_Male,
count(case when gender = 'F' then 0 end) as count_Female
from modified_hrdata
-- where Attrition = 'No'
group by Traininghours_bucket, Age_bucket
order by Age_bucket;

-- 3. servicebucket vs training hrs with avg salary, performance & satisfaction score
select service_bucket, Traininghours_bucket, count(*) as emp_count,
-- count(case when gender = 'M' then 1 end) as count_Male,
-- count(case when gender = 'F' then 0 end) as count_Female,
round(avg(workhours),0) as avg_workhours,
round(avg(performancerating),0) as avg_perf_rating,
round(avg(satisfactionscore),0) as avg_satisfactionscore,
round(avg(salary),0) as avg_salary
from modified_hrdata
-- where attrition = 'No'
group by service_bucket, Traininghours_bucket;

-- 4. relation b/w work hours & training hours with attrition yes & no:
select Traininghours_bucket, count(*) as emp_count,
round(avg(workhours),0) as avg_workhours,
round(avg(performancerating),0) as avg_perf_rating,
round(avg(satisfactionscore),0) as avg_satisfactionscore,
round(avg(salary),0) as avg_salary
from modified_hrdata
-- where attrition = 'Yes'
where attrition = 'No'
group by Traininghours_bucket;

-- 5. position, training hrs
select department, position, count(*) as emp_count,
round(avg(traininghours),0) as avg_traininghrs,
round(avg(performancerating),0) as avg_performancerate,
round(avg(yearsofservice),0) as avg_yrsofservice,
round(avg(workhours),0) as avg_workhours,
round(avg(satisfactionscore),0) as avg_satisfactionscore,
count(case when promotion = 'Yes' then 1 end) as promoted,
count(case when promotion = 'No' then 1 end) as Not_promoted,
round(avg(salary),0) as avg_salary 
from modified_hrdata
-- where traininghours <= 20 and performancerating < 5
-- where traininghours > 20 and performancerating > 4
-- where attrition = 'Yes'
where workhours> 42 and TrainingHours <=20
group by department, Traininghours_bucket, position;

-- trail to compare any relation b/w no_of days got promoted & training hours, but here min it was 1.5 yrs since they got last promotion
with newtab_formatted_date as (
select *, date_format(ifnull(str_to_date(lastpromotiondate,'%d-%m-%Y'),lastpromotiondate),'%Y-%m-%d') as formatted_date 
from modified_hrdata)
select department, 
position, 
count(*) as emp_count,
round(avg(traininghours),0) as avg_traininghrs,
round(avg(performancerating),0) as avg_performancerate,
round(avg(yearsofservice),0) as avg_yrsofservice,
round(avg(workhours),0) as avg_workhours,
round(avg(satisfactionscore),0) as avg_satisfactionscore,
count(case when promotion = 'Yes' then 1 end) as promoted,
count(case when promotion = 'No' then 1 end) as Not_promoted,
round(avg(datediff(now(),formatted_date)),0) as days_gotpromoted from newtab_formatted_date
where promotion = 'Yes'
group by department, position, Traininghours_bucket;








