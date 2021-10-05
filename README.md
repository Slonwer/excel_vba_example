# vba_challenge
## Overview of Spreadsheet contents
The Excel file contains four worksheets: "All Stocks Analysis", "2017", "2018", and "AllStocksAnalysis". The "2017" and "2018" worksheets contains the stock data for those years that we have been working with in this module. The "AllStocksAnalysis" worksheet contains the original output from the VBA script that we were working with in this module. It contains the two buttons that allows one to clear all data and run the analysis by year. The "All Stocks Analysis" worksheet contains the output from this specific challenge assignment in which the code is refactored. Running the module associated with it will populate the worksheet with the appropriate data and display a popup message of the runtime. To access the module containing the refactored code associated with this worksheet, open the Visual Basic editor and click on Module 6.  The module can then be run as normal.  
## Overview of Project  
The purpose of this project is to refactor existing code and compare runtimes. The purpose behind refactoring code is to modify it to run faster or more efficiently or with less lines or steps.  For this project we are working with a workbook we created for "Steve" that allows him to analyze the annual performance of a large number of stocks identifiable based on their Ticker for whichever year he chooses.  
## Results  
### Stock Performance by Year  
Clearly, 2017 was a better year overall for the stocks in question with majority of stocks experiencing a gain. The exception to this was TerraForm Power Inc. (TERP) which experienced a loss of  roughly 7 percent. The highest gain was Daqo New Energy Corp. (DQ). Average percentage gain for the stocks in question was roughly 67% for that year:  

![Pic](https://user-images.githubusercontent.com/60231630/136114010-e8f8019f-ccf3-4171-8aa1-d813507d0cab.png)


A glance at 2018 shows that year was not good for the majority of the stocks in question. All except for two stocks recorded a loss for that year.  The exceptions were Enphase Energy Inc. (ENPH) and Sunrun Inc. (RUN) which recorded net gain for that year. However, an average loss of roughly 8 percent was recorded for all the stocks in question:  

![Pic2](https://user-images.githubusercontent.com/60231630/136114027-0d99a557-1893-4de3-9c77-b454be4daf7a.png)


Perhaps these might be stocks Steve would consider looking into however a lot of other factors must be considered before making such a decision.  

### Code Changes and Performance  
The refactored code was almost seven times faster for both years. For 2017, the original script executed in roughly .754 seconds:  


![Pic3](https://user-images.githubusercontent.com/60231630/136113247-3fb58b44-52bf-45e0-8b01-3ea22f7debd3.png)  

The refactored code executed in roughly 0.11 seconds for that year (see image files in resources folder).  For 2018 the original script executed in .761 seconds:  

![Pic4](https://user-images.githubusercontent.com/60231630/136113598-7df598c5-95f0-4d66-9c03-d0ac46578180.png)

The refactored code executed in roughly 0.12 seconds for that year (see image files in resources folder). A glance at the original and refactored code shows the reason behind these execution times: The original code utilizes a nested loop meaning that for every iteration of one loop, it must execute a second loop and do this repeatedly (the second loop involves looping through a fairly large worksheet):  

![Pic5](https://user-images.githubusercontent.com/60231630/136115046-d953a4f8-eeb7-4b7d-af1f-8b6a5fcdeefb.png)


The refactored code, on the other hand, utilizes only one loop and, based on row and column contents, puts those elements into separate arrays which are then later accessed to fill in the data required in the worksheet stock analysis: 

![Pic6](https://user-images.githubusercontent.com/60231630/136115496-ebce990f-b8bc-4c2e-9160-2f76484372c8.png)

This was accomplished by iterating an indexing variable stored in "tickerIndex".  

## Summary  
### Advantages/Disadvantages of Refactoring Code
The main advantage is that you have a starting framework to work from as opposed to having to write code from scratch. Furthermore, refactored code tends to run better and more efficiently which may be advantageous if dealing with large datasets. A disadvantage would be if the code being refactored is poorly written or lacks comments for clarification. This could be problematic if the code must be adapted to deal with a more complex dataset.   
### Advantages/Disadvantages of Refactored VBA script  
The obvious advantage here is both the faster run time and the better organization of the refactored code. Note that the data was parsed into three different arrays. This helps with organization and troubleshooting should issues arise. Furthermore, the lack of nested loops makes the code easier to interpret.  The original script might be advantageous in that there aren't as many arrays to work with; however this seems trivial at this point.  
