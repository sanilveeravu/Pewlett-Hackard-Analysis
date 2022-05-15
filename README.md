# Pewlett-Hackard Analysis

## Overview of Analysis

Pewlett Hackard is a large company and its been around for long time. As baby boomers begin to retire at a rapid rate they were looking to the future in 2 ways. First it's offering a retirement package for those who meet certain criteria. Second to think about which positions will need to be filled in the near future. The number of upcoming retirements will leave thousands of job openings.

To prepare for the silver tsunami, this analysis is focussed on determining the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program. With this data, perform an additional analysis on the patterns seen and help Pewlett Hackard with these observations and recommendations.

## Resources
- Data Source: departments.csv, dept_emp.csv, dept_manager.csv, employees.csv, salaries.csv, titles.csv
- Software: Postgres, PGAdmin

---

## Results

Provide a bulleted list with four major points from the two analysis deliverables. Use images as support where needed.

1. There are 300,024 employee details in the employee database.

2. On joining the employee table with titles and using only current active tiles we could see there are 72,458 positions that would be eligible for retirement over the next 3 years.

3. 35.77% of the titles eligible for retirement were Senior Engineer's and 34.40% of the tiles were Senior Staff's taking up 70% percentage of the list. Besides these 12.81% belonged to Engineer's, 10.54% belong to Staff's, 4.97% for Technique Leader, 1.5% for Assitant Engineer and a neglible count for Manager's. Below image shows the count for each of these titles

![RetiringTitlesCount](Analysis%20Projects%20Folder/Pewlett-Hackard-Analysis%20Folder/RetiringTitlesCount.png)

4. Considering employees born in the year 1965 eligbile for mentorship only 1,549 qualified for it. 

---

## Summary

- How many roles will need to be filled as the "silver tsunami" begins to make an impact?
    - 72,458 employees will be eligible for retirement in the next 3 years.

- Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
    - Looking at the count across tiles, yes it looks like there are enough qualified, retirement ready employees to mentor, At an average we can around 18,000 employees for each birth year excluding 1965. But looking at data from 1965 birth year the count eligible for mentorship is less. This could attribute either to a data issue with incomplete data as the counts for 1965 is very less with no additional years or reality that this was the state at that time. 

- Additional Insights
    - On looking into the employees, was able to see only 240,124 out of 300,024 are active employees.

    Link to Code

    - To analyze further reserached on checking how much is the count by year by title

    Link to Code

    ![byyearcnt](Analysis%20Projects%20Folder/Pewlett-Hackard-Analysis%20Folder/byyearcnt.png)

With this the initial action would be to confirm the data accuracy to confirm the data from 1965 and onwards are included or not. If the data is accurate, the key insight will be that mentorship eligibility should be scoped to other years probably from 1962 to 1965 for the short term. But defnitely a new recruitment for the work force for these 72,458 positions need to be evaulated and planned. Would need to look into titles that need a replacement and positions that could be reduced with options for improved efficiency.

