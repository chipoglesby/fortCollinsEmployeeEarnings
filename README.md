Fort Collins, Colorado Employee Earnings
================

An analysis of [2015 Fort Collins CO Employee Earnings](http://www.fcgov.com/openbook/?action=browse-salaries)

Data overview
-------------

The data pulled from the Fort Collins Open Book website is available in the [data folder](data/raw). There were variables added to the dataset:

1.  `serviceArea`: Using the [organizational chart](assets/fortCollinsOrganization.pdf), the the `serviceArea` was added to organize the service units and departments into a better structure.
2.  `year`: To tidy the data for future use, a `year` variable of 2015 was added to the data.
3.  `hourlyWage`: [In 2015, The Associated Press reported](http://denver.cbslocal.com/2015/01/01/colorado-minimum-wage-rises-to-8-23-in-2015/) that the minimum wage for Colorado was $8.23. Under the assumption that any employee earning more than $17,506/year, we calculated their possible hourly salary. Many employees are salaried, so this is more for information purposes.
4.  `status`: The status variable is used to help categorize employees into different buckets. Employees earning more than the assumed $8.23/hour would be labled as `full time` while anyone earning less would be `part time` or contract.

As of 2015, there are 13 Service areas with a total of 2165 employees.

    ## # A tibble: 12 × 5
    ##                              serviceArea departmentCount jobTitleCount
    ##                                    <chr>           <int>         <int>
    ## 1                  poudre fire authority               1            35
    ## 2                        police services               3            25
    ## 3      information and employee services               2            57
    ## 4                          city attorney               1            10
    ## 5                    deputy city manager               1             6
    ## 6                       utility services               9           105
    ## 7                           city manager               1            13
    ## 8       community and operation services               6           103
    ## 9                sustainability services               3            15
    ## 10 planning development & transportation               9           122
    ## 11                    financial services               5            33
    ## 12                      library services               1            36
    ## # ... with 2 more variables: employeeCount <int>, medianSalary <dbl>
