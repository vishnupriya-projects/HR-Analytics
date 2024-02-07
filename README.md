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
             
### Analysis and Insights:

#### Employee Attrition Analysis:

