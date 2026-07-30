#to read table
df=spark.read.table("Employeedata")
df.show()
# Read data into a DataFrame
# If your data is in a Lakehouse table
df = spark.read.table("Employeedata")

# Display the data
df.show()

# Check the schema
df.printSchema()

# Print the DataFrame object
print(df)

# Count the number of rows
print("Total Rows:", df.count())

# Rename the EmployeeName column to Name
df = df.withColumnRenamed("EmployeeName", "Name")

# Verify the renamed column
df.printSchema()

# Display the updated DataFrame
df.show()
#to add bonus column
from pyspark.sql.functions import col
df=df.withColumn(
    "Bonus",
     col("Salary")*0.10
)
df.show()
df=df.filter(df.Salary>50000)
df.show()
df.orderBy("Salary").show()
df.write.mode("overwrite").saveAsTable("Employee_Transformed")
