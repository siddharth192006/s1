```r
# Final Assignment Solutions

# 1. Air Quality Analysis in R (airquality)
# A. Filter for July
july_data <- subset(airquality, Month == 7)

# B. Average Ozone by Month
avg_ozone <- aggregate(Ozone ~ Month, data = airquality, FUN = mean, na.rm = TRUE)

# C. Using pipe operator to filter Ozone > 50
library(dplyr)
high_ozone <- airquality %>% filter(Ozone > 50)
```

```python
# 2. Air Quality Analysis in Python (mpg)
import seaborn as sns
import pandas as pd
mpg = sns.load_dataset('mpg')

# A. Analyze & impute missing values
mpg.fillna(mpg.mean(numeric_only=True), inplace=True)

# B. Average mpg per model year
avg_mpg_year = mpg.groupby('model_year')['mpg'].mean()
```

```r
# 3. Car Performance Analysis in R (mtcars)
# A. Fuel efficiency by transmission
mtcars$am <- factor(mtcars$am, labels = c("Automatic", "Manual"))
aggregate(mpg ~ am, data = mtcars, mean)

# B. Relationship between hp and mpg
plot(mtcars$hp, mtcars$mpg, main="HP vs MPG", xlab="Horsepower", ylab="MPG")
```

```python
# 4. Car Performance in Python (mpg)
print(mpg.head())
m, n = mpg.shape
column_names = mpg.columns.tolist()
avg_mpg_cyl = mpg.groupby('cylinders')['mpg'].mean()
sns.scatterplot(data=mpg, x='horsepower', y='mpg')
```

```r
# 5. PlantGrowth Analysis in R
# A. Avg weight by group
aggregate(weight ~ group, data = PlantGrowth, mean)

# B. Bar chart
library(ggplot2)
ggplot(PlantGrowth, aes(x=group, y=weight)) + stat_summary(fun=mean, geom="bar")
```

```python
# 6. Titanic Analysis in Python
titanic = sns.load_dataset('titanic')
survival_rate = titanic.groupby(['sex', 'class'])['survived'].mean()
filtered = titanic[(titanic['class']=='First') & (titanic['sex']=='female') & (titanic['fare'] > 50)]
```

```r
# 7. Iris in R
# A. Avg petal length and width
aggregate(cbind(Petal.Length, Petal.Width) ~ Species, data = iris, mean)

# B. Scatter plot
plot(iris$Sepal.Length, iris$Sepal.Width, col=iris$Species)
```

```python
# 8. Iris in Python
print(iris.info())
print(iris.describe())
print(iris.isnull().sum())
sns.scatterplot(data=iris, x='sepal_length', y='sepal_width', hue='species')
```

```r
# 9. Petal Length Distribution in R
hist(iris$Petal.Length, probability=TRUE, main="Petal Length")
lines(density(iris$Petal.Length))
```

```python
# 10. Petal Length Distribution in Python
sns.histplot(iris['petal_length'], kde=True)
```

```r
# 11. Vehicle Power vs Efficiency in R
high_hp <- mtcars[mtcars$hp > 150, ]
plot(mtcars$hp, mtcars$mpg)
```

```python
# 12. Ozone Time in Python (using mpg)
print(mpg['origin'].nunique())
sns.barplot(data=mpg, x='origin', y='mpg', estimator='mean')
```

```r
# 13. CO2 Emissions in R
aggregate(uptake ~ Treatment, data = CO2, mean)
aov_result <- aov(uptake ~ Type * Treatment, data = CO2)
summary(aov_result)
```

```python
# 14. Diamonds in Python
diamonds = sns.load_dataset('diamonds')
avg_price_cut = diamonds.groupby('cut')['price'].mean()
sns.boxplot(data=diamonds, x='clarity', y='price')
```

```r
# 15. Supermarket Sales in R
sales_data$Quantity[is.na(sales_data$Quantity)] <- 0
sales_data$Total_Sales[is.na(sales_data$Total_Sales)] <- sales_data$Quantity * sales_data$Price
sales_data$Quantity[sales_data$Quantity < 0] <- 0
aggregate(Total_Sales ~ Category, data = sales_data, sum)
```

```python
# 16. Supermarket Sales in Python
sales_data['Quantity'].fillna(0, inplace=True)
sales_data['Quantity'] = sales_data['Quantity'].apply(lambda x: max(x, 0))
sales_data['Total_Sales'] = sales_data['Quantity'] * sales_data['Price']
sales_summary = sales_data.groupby('Category')['Total_Sales'].sum()
```

```python
# 17. Order Dataset Cleanup
order_df['Customer'].fillna('Guest', inplace=True)
order_df['Quantity'].fillna(order_df['Quantity'].median(), inplace=True)
order_df['Product'].fillna('Unknown', inplace=True)
order_df = order_df.drop_duplicates(subset='Order_ID', keep='first')
order_df['Total Amount'] = order_df['Price'] * order_df['Quantity']
```

```python
# 18. Transaction Cleanup
df['Customer'].fillna('Guest', inplace=True)
df['Amount'].fillna(df['Amount'].mean(), inplace=True)
df['Discount'].fillna(0, inplace=True)
df = df.drop_duplicates(subset='Transaction_ID', keep='first')
df['Final Amount'] = df['Amount'] - (df['Amount'] * df['Discount'] / 100)
```

```python
# 19. Product Stock Cleanup
df['Product_Name'].fillna('Unknown', inplace=True)
df['Stock'].fillna(df['Stock'].median(), inplace=True)
df = df.drop_duplicates(subset='Product_ID', keep='first')
df['Stock Value'] = df['Stock'] * df['Price']
```