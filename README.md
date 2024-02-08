# HR-Analytics : Unlocking the secrets of attrition while maximizing training efficiency for a thriving workforce

### Breif Introduction: 
This report helps to provide insights into two key aspects of HR data : Employee attrition and training program effectiveness. The analysis is based on HR data that includes various metrics like age, department, performance ratings and more.

### Objective: 
The project focus on two primary things:
1. To determine the factors that contribute to employee attrition within the company and provide insights to reduce attrition rates.
2. To analyze the effectiveness of Employee Training Programs and recommended improvements for optimization.

### Data Cleaning and prepartion:
1. From the given dataset, there are disprencies in following column data and it was fixed & new columns were created for further analysis.
      - In the gender column, Male = 'M' and Female = 'F' was replaced.
      - In the Department column, Data Scientist = 'DataScientist', Marketing Analyst = 'Marketinganalyst' was replaced.
      - In last promotion date column, all date needs to fix into yyyy-mm-dd format. (here CTE function was used to fix dates).
2. New columns were created to divide into categories as
   1. Age_bucket:
      - age < 30 then 'under 30'
      - age between 30 and 40 then 'b/w 30 & 40'
      - age  'above 40’
   2. Service_bucket:
      - yearsofservice <=3 then 'below 3yrs '
      - yearsofservice between 3 and 6 then 'b/w 4-6 yrs'
      - yearsofservice between 6 and 9 then 'b/w 7-9 yrs'
      - else 'above 9 yrs'
   3. salary_bucket:
      - Salary <=50000 then 'below 50K '
      - Salary between 50000 and 60000 then '50-60K'
      - Salary between 60000 and 70000 then '60-70K'
      - Salary between 70000 and 80000 then '70-80K'
      - Salary between 80000 and 90000 then '80-90K'
      - else 'above 90K'
    4. Traininghours_bucket:
       - Traininghours <=15 THEN 'b/w 10-15 hrs'
       - Traininghours BETWEEN 15 AND 20 THEN 'b/w 16-20 hrs'
       - ELSE 'above 20 hrs
             
### Analysis and Insights:
#### 1. Consolidating Averages of all relevant columns:
   
![image](https://github.com/vishnupriya-projects/HR-Analytics/assets/159273003/98642477-859d-41f3-88db-d28904f47837)

Above table represents average data for relevant columns, following are observations: 
- The average age is above 30 years.
- Years of service is above 5 years, the avg & years of service indicating that senior/mid senior level employees are having most attrition rate.
- Salary of attrition employee is greater than average salary of employees & employees who retain in company, this can be one of the factors for employees’ attrition.
- Working hours are more than average for employees who left company & less than avg for employees who retain in company, this can be one of the factors for employees’ attrition.
- Training hours are more for employees who retain in company & less for who left, this can be one of the factors for employees’ attrition.
- Performance rating & satisfaction score is having common average score of 4.
#### 2. Gender wise Attrition Rate:
  
From the below results, the male (35%) & female (32%) both has almost equal attrition rates. So, specific gender has no impact on overall attrition rate.

![image](https://github.com/vishnupriya-projects/HR-Analytics/assets/159273003/be212408-9dc1-40a3-9981-033078520df7)

#### 3. Department wise Attrition Rate vs promotion rate:

![image](https://github.com/vishnupriya-projects/HR-Analytics/assets/159273003/aa69af39-fc2a-4852-a8aa-c4b973bebd96)
- From the above results, it was clearly saying that Finance (54%) department has more attrition rates followed by IT (35%), Marketing (30%), HR (25%) and Sales (20%).
- But promotion rate was least for marketing followed by HR, IT, Finance and sales. So, for attrition, promotion is not only the factor there can be potential other factors too.

#### 4. Service wise Attrition Rate, promotion rate, avg performance rating, satisfaction score, working hours & training hours

![image](https://github.com/vishnupriya-projects/HR-Analytics/assets/159273003/5163ed85-3cf2-40a5-9c62-d38aa61f45c5)

- From the above results, it was clearly saying that b/w 7-9 yrs (50%) service period has more attrition rates followed by below 3yrs (38%), b/w 4-6yrs (23%) and above 9 yrs (25%) attrition rate was almost in similar.
- It indicates senior team & fresher team might having more attrition rates. The average working hours are similar to each other & training hours are similar except b/w 4-6 yrs. This indicates promotion is the main reason for attrition and for below 3yrs, they are not satisfied with job.

#### 5. Salary wise Attrition Rate, promotion rate, avg performance rating, satisfaction score, working hours & training hours

![image](https://github.com/vishnupriya-projects/HR-Analytics/assets/159273003/2123cd25-a558-4e95-93a8-866ff67d039a)

- The above results indicating that attrition rate is higher for people having high salary. If we see for higher salary, working hours (42) are more & training hours are less (18).
- If we see below 50K salary range, attrition rate is 11% & satisfaction score is 3 So, it means salary & promotion rate can be factors for attrition rate, there could be other factors to be considered.
- From 4 & 5 points we see that the people below 50K salary and age below 3 yrs having avg satisfaction score is less, this can be reason for attrition.
- To get more clarity on data, we need to check the position wise salary & service bucket along with other possible factors such as workhours, training hours, promotion rate.

#### 6. Position vs attrition rate, service bucket, average_(salary, workhours, training hours, promotion rate)
The below are the tables will clearly show us the reasons for attrition rates for each individual position.

![image](https://github.com/vishnupriya-projects/HR-Analytics/assets/159273003/e8764ace-42d1-4fdf-921a-ecb878df4e2c)

 1. In finance department, in financial analyst below 3yrs & b/w 7-9 yrs have more attrition due to high workhours and less promotion (<20%). For service b/w 4-6 yrs the workhours & training hours are balanced but still promotion rate is less (37%) so, the attrition rate also less.
 2. For financial manager, below 3yrs & b/w 7-9 yrs service people was left due to no promotion and very high workhours and for service b/w 4-6 yrs the workhours & training hours are balanced but still there is no promotion rate (0%).
 3. In HR department, for below 3yrs & b/w 4-6 yrs have more attrition due to high workhours, and less promotion (<20%), salary can be least contributing because in 4-6 yrs, people who stayed in company are more than left & salary is almost common for all service age groups.
 4. In IT for data scientist b/w 7-9 yrs people was left due to less salary compared with overall average salary, less promotion rate (14%) and working hours are more.
 6. For below 3yrs, b/w 4-6 yrs people, if we see combinedly, the attrition rate was less, may be the work hours more and average training hours are less.
 7. For software engineer’s b/w 7-9 yrs people left because the salary is less than b/w 4-6 yrs service people and attrition, promotion rate both are same, so people who left are due to lack of promotion.
 8. For 4-6 yrs lack of training & promotion are reasons, for above 9 yrs the promotion and working hours are reasons to left.
 9. In marketing department, for analyst promotion is the factor for attrition & manager position, promotion (0%) & workhours are the factors.
 10. In sales team, the sales associate position was left due to no promotion & less salary, in sales manager position b/w 4-6 yrs the working & training hours are balanced so attrition rate is less.
 11. For sales manager position b/w 7-9 yrs, the promotion & least training hours are the reasons to left company.
     
![image](https://github.com/vishnupriya-projects/HR-Analytics/assets/159273003/cc46d44e-b36e-4ef5-a1bd-c93467c589cc)

### Recoomndations:

### Acknowledgement:

