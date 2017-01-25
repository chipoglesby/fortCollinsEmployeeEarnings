Fort Collins, Colorado Employee Earnings
================

An analysis of [2015 Fort Collins CO Employee Earnings](http://www.fcgov.com/openbook/?action=browse-salaries)

Data overview
-------------

The data pulled from the Fort Collins Open Book website is available in the [data folder](data/raw). There were variables added to the dataset:

1.  `serviceArea`: Using the [organizational chart](assets/fortCollinsOrganization.pdf), the the `serviceArea` was added to organize the service units and departments into a better structure.
2.  `year`: To tidy the data for future use, a `year` variable of 2015 was added to the data.
3.  `hourlyWage`: [In 2015, The Associated Press reported](http://denver.cbslocal.com/2015/01/01/colorado-minimum-wage-rises-to-8-23-in-2015/) that the minimum wage for Colorado was $8.23. Under the assumption that any employee earning more than $17,506/year would be full time, we calculated their possible hourly salary. Many employees are salaried, so this is more for informational purposes.
4.  `status`: The status variable is used to help categorize employees into different buckets. Employees earning more than the assumed $8.23/hour would be labled as `full time` while anyone earning less would be `part time` or contract.

As of 2015, there are 11 service areas with a total of 1416 employees.

### Data example

| jobTitle                  | department             |  earnings|  year| serviceArea                       |  hourlyWage| status    |
|:--------------------------|:-----------------------|---------:|-----:|:----------------------------------|-----------:|:----------|
| city manager              | city manager's office  |  258704.9|  2015| city manager                      |      124.38| full time |
| deputy city manager       | city manager's office  |  174086.5|  2015| city manager                      |       83.70| full time |
| chief of police           | office of the chief    |  169963.8|  2015| police services                   |       81.71| full time |
| chief financial officer   | finance administration |  163179.2|  2015| financial services                |       78.45| full time |
| assistant city manager    | city manager's office  |  159519.0|  2015| city manager                      |       76.69| full time |
| assistant city manager    | city manager's office  |  156335.9|  2015| city manager                      |       75.16| full time |
| city attorney             | city attorney's office |  139572.6|  2015| city attorney                     |       67.10| full time |
| police assistant chief    | office of the chief    |  134733.9|  2015| police services                   |       64.78| full time |
| chief information officer | information technology |  130630.2|  2015| information and employee services |       62.80| full time |
| systems analyst           | information technology |  128388.3|  2015| information and employee services |       61.73| full time |

Overview Table
--------------

| serviceArea                           |  departmentCount|  jobTitleCount|  employeeCount|  medianSalary|
|:--------------------------------------|----------------:|--------------:|--------------:|-------------:|
| planning development & transportation |                9|            122|            391|      37477.48|
| police services                       |                3|             25|            286|      80195.07|
| community and operation services      |                6|            103|            255|      47498.33|
| utility services                      |                9|            105|            244|      54644.11|
| information and employee services     |                2|             57|             98|      65725.87|
| financial services                    |                6|             38|             55|      36946.86|
| city attorney                         |                1|             10|             24|      57571.79|
| sustainability services               |                3|             15|             23|      42539.25|
| city manager                          |                1|             13|             20|      48765.03|
| judicial services                     |                1|              8|             14|      20111.85|
| deputy city manager                   |                1|              6|              6|      57108.05|
