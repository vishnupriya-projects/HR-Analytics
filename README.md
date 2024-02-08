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
             
### Analysis and Insights (Object 1)
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

### Recommndations:
- Promotion rate > high working hours > salary > satisfaction score are the 4 main reason for overall attrition rate in all departments. To reduce the attrition rates the following are the insights to take actions.
- In manger level positions mainly service > 9 yrs and b/w 7-9 yrs for all departments these people are most important for company in terms of leadership and managing teams. Giving timely promotions and reducing working hours will reduce the attrition rate.
- For entry-level positions below 3 yrs and having salary <50k, even though training hours are equal to average value (20hrs) there satisfaction score is less due to working hours are more, salary is less which makes more attrition rates, to reduce it need to improve salary based on performance with timely promotions and reduce working hours.
- It will be good if their seniors/mangers could do one to one session with their team members to understand their needs & problems which helps to increase their productivity.
- For mid-level positions b/w 4-6 yrs, where the overall attrition was less, due to most of the departments such as sales, marketing and finance has balanced working hours and training hours.
- In IT & HR department working hours are more, training hours are less, and salary is less than average values and these could be reason for attrition.
- To avoid this proper training hours, need to conduct to respective departments and proper salary increment should be given based on performance will reduce attritions and improve productivity.
From all above points it concludes that balanced working hours, training hours are first criteria to retain in company and increments/promotion based on performance are second criteria to reduce attrition rates.

### Analysis and Insights (Object 2):
#### 1. Finding relation b/w attrition, promotion & training hours:

![image](https://github.com/vishnupriya-projects/HR-Analytics/assets/159273003/105ac6a5-7889-4d09-9b5c-4fccc85f9319)

- From above table we can say that most employee’s having less training hours have left the company & employees having >20 hrs training retained in the company.
- If we see most promoted people are having training hours > 20 hrs & not promoted having less training hours <=15.
This concludes more training hours are needed for employees to improve their productivity & to retain in company.

#### 2. Relation b/w Gender, age and training hours:

![image](https://github.com/vishnupriya-projects/HR-Analytics/assets/159273003/e422b1ab-ac54-412b-b9b3-6b61d6099760)

- From above table, female folks of all age groups are getting training above 20 hrs, Whereas male folks are getting training hours b/w 10-15 hrs under 30 yrs & above 20hrs b/w 30 & 40 age group.
- This means female employees taking more training hours compared to male employees and training hours needs to improve for under 30 age folks.

#### 3. Relation b/w work hours & training hours with attrition yes & no:
Table below is when Attrition is ‘yes’

![image](https://github.com/vishnupriya-projects/HR-Analytics/assets/159273003/7bbca947-a1e1-4705-86bc-47589ffac82e)

- The above table represents data of employees who left company and it clearly explains that at when working hrs increases, the training hours are reduced. That means there is no balance b/w workhours & training hours, this can be reason for employees left company.
Table below: when Attrition is ‘No’

![image](https://github.com/vishnupriya-projects/HR-Analytics/assets/159273003/a22efe60-16a5-4a57-bf7c-2462292d3cb6)

- From above table, it clearly shows people having higher > 20 hrs training retained in company & working hours within limits.
- For employees having less training hours it can be due to they are not interested in existing training module or they need any advance training need to figure out.

#### 4. Service bucket vs training hours with avg_workhours:

![image](https://github.com/vishnupriya-projects/HR-Analytics/assets/159273003/fc027099-2891-4680-bcb2-dc3df73bd634)

- From above table, for employees having service below 3yrs the satisfaction score was less, due to less training hrs (10-15 hrs) & overall training hrs also less than average (20 hrs) for most of employees it can be due to high working hours.
- For b/w 4- 6 yrs service employees, shows majority count of less training hours, it clearly shows this area needs to be improve taking feedback from employees whether they are having sufficient training resources or training modules need to change.
- For b/w 7- 9 yrs service employees, majority having above 20 hrs training hrs, for below 20 hrs training hours we see that working hours are more & b/w 16-20 hrs satisfaction score was less may be due to salary or working hours.
Overall, whenever working hours are >40 then people training hours are reducing to below 20 hrs.

#### 5. Position vs training hours, performance rate, satisfaction score, working hours & promotion:

![image](https://github.com/vishnupriya-projects/HR-Analytics/assets/159273003/c908b3fc-e7d6-4aa7-9b12-e0b59154326e)

- From above table, if we see, the HR coordinator having least avg performance rating irrespective of their training hours, it could be due their workhours are not balanced, which effecting their avg satisfaction score.
- If we see market analyst, having least avg performance rating irrespective of their training hours, work hours are balanced and salary also similar, it can be due to their training modules are not effective or could be other reasons which effecting their avg satisfaction score.

![image](https://github.com/vishnupriya-projects/HR-Analytics/assets/159273003/956bd716-32d7-448a-bbc3-1072427ecb19)

- From the above table, we see that data scientist (b/w 4-6 yrs service) count was more in getting less training hours from overall employees. In ‘IT’ if we see software engineer & data scientist having high training hours, they are getting more promoted than employees with less training hours.

![image](https://github.com/vishnupriya-projects/HR-Analytics/assets/159273003/92c25cfb-12f2-4a02-b4ec-5d3b432b5a8b)

- From the above table, we see that sales manager (avg 4 yrs of service) count was more in getting less training hours and not getting promoted. If we see employees having more training has performance also good, they are promoting too.

![image](https://github.com/vishnupriya-projects/HR-Analytics/assets/159273003/e0b1606d-f185-46be-a22a-d55790e2fb01)

- From finance department, we see that most of people having avg training hours more & their performance too, but no balance of training & working hours.

### Recommndations:
- More Employees are retained if they are getting more training hours & also resulting them to get promoted & increased performance rate.
- In gender wise, female employees are getting more average training hours than male employees. it could be due to their parental breaks or more information needed to find more insights.
- Employees having balanced working hours & training hours are more who retained in company & who left has more working hours due to which they are unable to involve in training sessions.
- DATASCIENTIST >FINANCE department> HR department these are the areas where workhours are very high & training hours are less, need to focus to balance working hours & training hours.
- In terms of service wise, for 4-6 yrs majority has very less training hours followed by below 3 yrs.
- For b/w 7-9 yrs they have more training hours compared to other service age groups.
- Compared to senior level, the fresher & mid senior level team needs more training hours.
- Current training hours in terms of service: 7-9 yrs > below 3 yrs > 4-6 yrs.
- Optimized training hours:  below 3 yrs > 4-6 yrs > 7-9 yrs.
- If we optimize training hours for senior team & increase training for mid senior and fresher team will improve more productivity on employees. 










### Acknowledgement:

