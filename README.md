# Zomato Database - Data Analysis using SQL

![](https://cdn.businesstraveller.com/wp-content/uploads/fly-images/1002269/zomato-infinity-dining-916x516-1-916x516.jpg)


## About the Dataset
The Zomato Restaurant Dataset is a comprehensive collection of restaurant data sourced from the popular online food delivery platform, Zomato. This dataset contains information about various restaurants listed on the platform, including their location, cuisine type, ratings, user reviews, and other essential attributes. You can find this dataset on Kaggle [here](https://www.kaggle.com/datasets/abhijitdahatonde/zomato-restaurants-dataset).

## Data Exploration
In the data exploration phase, all the following tasks were performed to understand, clean, and prepare the dataset for the analysis:

- **Dataset Description:** Checked all the details of the table to understand its structure and attributes.

- **Duplicate Entries:** Identified and addressed duplicate restaurant entries based on the 'restaurant name' column to ensure data quality.

- **Handling Invalid Entries:** Conducted checks to identify rows with potentially invalid restaurant names, such as entries starting with special characters.

- **Data Cleansing:** Applied several updates to clean the data, removing characters at the beginning of restaurant names and rows with character encoding problems.

- **Distinct Values:** Identified distinct values in the 'table_booking' and 'online_order' columns to provide insights into restaurant services.

- **Rate Column Validation:** Verified the 'rate' column's values to ensure they fell within the expected rating range of 1 to 5.

- **Counting Restaurants:** Counted the number of restaurants in each area and local address to offer insights into regional restaurant distributions.

- **Missing Value Check:** Checked for missing values in the dataset to ensure data completeness.

- **Cuisines Analysis:** Explored the 'cuisine' column to extract and count individual cuisines, providing insights into the distribution of different cuisines.

These data exploration tasks ensured that the dataset is clean and ready for analysis.

## Data Analysis
The data analysis is divided into three sections:

### Section A: Rating Analysis
In this section, the focus is on restaurant ratings, examining areas, weighted average ratings, highest and lowest-rated areas, and the percentage of highly-rated restaurants. Weighted average ratings provide a fair assessment of restaurant performance, aiding both diners and restaurant owners in making informed decisions. The analysis highlights regions with exceptional dining experiences, helping both diners and restaurant owners identify standout areas.

*(Note: We used weighted averages in our analysis because they provide a more accurate representation of a restaurant's rating, taking into account the varying number of ratings ("num_ratings") that each restaurant received. This approach ensures that restaurants with more ratings have a proportionally higher influence on the overall rating, helping diners make more informed choices and aiding restaurant owners in assessing their performance.)*

### Section B: Online Orders and Table Bookings
The second section explores the availability of online orders and table bookings across different areas. The analysis includes the number of restaurants offering these services, areas with both online orders and table bookings

### Section C: Cost Analysis
In this section, the analysis delves into the distribution of average costs for two people. It compares the average costs by area and identifies areas with the highest and lowest average costs. This analysis is valuable for diners seeking restaurants that fit their budget and assists restaurant owners in setting competitive prices. However, it's essential to recognize potential data biases and the dynamic nature of pricing trends in the restaurant industry. These findings offer practical guidance to diners for making budget-friendly choices and restaurant owners for pricing strategies in specific areas.

## Key Findings

- The restaurant dataset exhibits variations in average ratings across different areas and local addresses, with Residency Road and St. Marks Road having the highest average rating of 4.4.

- Jayanagar and Koramangala 7th Block are the areas with the highest average rating, reaching 4.6, while MG Road has the lowest average rating at 2.6.

- Approximately only 1.4% of restaurants in the dataset have ratings above or equal to 4.5.

- The analysis of online orders and table bookings shows variations across different areas, with Electronic City and Bannerghatta Road having the most restaurants offering online orders.

- Rammurthy Nagar, Nagarbhavi, and Uttarahalli are among the areas with the highest percentage of restaurants providing online orders, reaching 100%.

- The number of restaurants offering table bookings varies by area, with Banashankari, Bannerghatta Road, and Brookefield having the highest counts.

- The distribution of average costs for two people in the dataset ranges from 100 to 1900. The most common cost brackets are 300-400 and 200-300.

- Areas with the highest average costs include Malleshwaram on Sankey Road and Lavelle Road on Residency Road. In contrast, Brigade Road in Whitefield and Commercial Street have the lowest average costs at 100.
