# Fort Collins, Colorado Employee Earnings
An analysis of [2015 Fort Collins CO Employee Earnings](http://www.fcgov.com/openbook/?action=browse-salaries)

## Data overview
The data pulled from the Fort Collins Open Book website is available in the [data folder](data/raw). 

There were variables added to the dataset:

1. `serviceArea`: Using the [organizational chart](assets/fortCollinsOrganization.pdf),
the the `serviceArea` was added to better organize the service units and departments.
2. `year`: To tidy the data for future use, a `year` variable of 2015 was added to the data.
3. `hourlyWage`. [In 2015, The Associated Press reported](http://denver.cbslocal.com/2015/01/01/colorado-minimum-wage-rises-to-8-23-in-2015/) that the minimum
wage for Colorado was $8.23. Under the assumption that any employee earning more than $17,506/year, we calculated
their possible hourly salary. Many employees are salaried, so this is more for information purposes.
4. `status`: The status variable is used to help categorize employees into different buckets. Employees earning more
than the assumed $8.23/hour would be labled as `full time` while anyone earning less would be `part time` or contract.