This is a simple ETA (extract, transform, Analyze) Portfolio of the sample Olympic data from Kaggle using the Microsoft Azure platform and Apps.

Apps used in this project includes
* Kaggle (For the data set)
* Azure Data Factories ( For data ingestion)
* Azure Data Lake (For storing data)
* App registration (for mounting data bricks to data lake)
* Azure Data Bricks ( to transform data)
* Azure Synapse Analytics ( to analyse data)
* Tableau ( to visualize data)

The flow goes as below:
# Dataset from Kaggle >> Azure Data Factories >> Azure Data Lake - 1 >> Azure Data Bricks >> Azure Data Lake - 2 >> Azure Synapse Analytics >> Tableau

Note:
This project can be executed with any one of the Azure apps mentioned above but for the educational understanding of all the apps, I am doing it with individual apps 
Steps:

1. Download the olympic data from kaggle
download link : https://www.kaggle.com/datasets/arjunprasadsarkhel/2021-olympics-in-tokyo

<img width="937" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/2b34e077-a4c0-45de-b69c-ca3f71e162f9">

The sample dataset contains five CSV files namely
* Atheletes
* Coaches
* EntriesGender
* Medals
* Teams

2. Once you have downloaded and unzipped the folder, extract data and upload it to github.

3. Now go to Azure and Login into your account 
If you don't have a Azure acount you can create one for free with $200 credit
instructions to create a new free trial azure account : https://azurelessons.com/create-azure-free-account/

4. Lets now create a new Data lake and Data factories via Azure portal
Select the hamburger icon and select storage on the left menu
<img width="966" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/28a70262-cd6f-4c64-a6cd-db32c37230ed">

select create option on the top left corner to create a new storage account
<img width="957" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/45a7c7b8-78de-49ee-81e3-76dcab3e8e08">

On Basics tab make the following changes
* Resource group name : create a new resource group name with the name easy for you to understand ( I gave DA_Portfolio_Olympic)
* Storage account name : give a name of choice which shoul dbe unique and lowercase only (I gave portfolioolympicdataset) 
* Region: Select nearest region ( I chose Asia Pacific: South India)
<img width="470" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/38f4ed25-3ee0-420e-8ca0-f1d46baa301b">

keep other as default and click Next

On advance tab just enable hierarchy and keep else as it is default
<img width="376" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/d29b1b1d-7ac5-423f-bf39-d01b070aee10">

Keep options in other tab as default and give next till review and create.

once created the storage should lok like below image 
<img width="778" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/5d604093-f51b-40f4-ac08-24f1fe3c5666">

Now lets create a container to keep our data
select the container option in the left corner and click + Container option and give your container a name of your choice adn select create 
<img width="961" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/a99a1144-7d62-4399-beb0-702fbc7a0a5c">

Now inside our container we will create two folders which will hold the raw and transformed data respectively
to create folders inside container select select container you created select + Add Directories, provide name to the folder and select save
<img width="932" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/27c09139-07e0-458a-a4be-ddd9c560cc29">

repeat the process to create the next folder 

once you have created your storage account it will be in this hierarchy 
storage account ( portfolioolympicdataset)
  Container (olympic-dataset)
    Folder 1 (rawData)
    Folder 2 (Transformed Data)

Now we will create our Data factories to ingest the data into Azure
search for data factories in the search option and go to data Factories page 
Select '+ Create' option to create a new data factory
<img width="583" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/276eae9e-6e8e-47ef-bc51-4f7c9eb4809a">

Make the changes mentioned in the image below and press 'Review & Create' to create your data factory
<img width="447" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/801b5ddd-0212-45a4-ab9e-b642fb773089">

now we have successfully created Storage account and a data factory

5. we will ingest the data in data factory now
Click on the data factory you have created and select 'Launch Studio' option in the centre which will launch a whole new
data factories studio page
<img width="921" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/e62b0307-0454-4f42-8eeb-18f060fa2bac">

<img width="955" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/3e33e460-c448-4278-8255-a8c301f69f34">

You can learn more about Azure Data Factories here : https://learn.microsoft.com/en-in/azure/data-factory/author-visually?tabs=data-factory

Now goto authour >> Factory resource >> '+' near serch bar >> pipeline >> pipeline
<img width="960" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/db7502de-33d3-49b4-a142-1e7e140388f7">

Give pipeline a name of your choice. I am naming it as ingest_Data
<img width="954" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/7ef66fa1-87e0-4887-b91e-90fde7d5bfce">

Select the properties icon to hide the pipeline name pane fro now
<img width="960" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/bd6dc1c0-a0c3-4813-853e-03fda0cb79b1">

In activity panel under 'Move and transform' drop down drag and drop 'Copy Data' option main panel
<img width="960" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/e3902381-fb8f-45da-865e-85defba824c4">

In general tab give the name of the copy data as 'athelete' 
<img width="696" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/578865ac-064c-44da-a93d-52cecdbf28bf">
  
Now click source tab to extract our athelete data from github
press '+ New' option to add data source link
<img width="830" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/46bcbd9a-0d5f-4967-9a55-a406fbfd756d">
  
search for 'HTTP" option and select 'CSV'
<img width="944" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/087334bd-79a2-4a7b-b62b-3a9f52750944">
  
<img width="956" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/72e27cc1-afaa-47f7-bfe4-0c7592ec1aeb">
  
Change Name to athelete and click 'Linked Service' dropdown and click new
<img width="954" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/8aa7a6a3-d9c3-4d09-9fa8-9604f873adbd">
  
Give name as atheletesource
<img width="930" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/69337d26-f743-4173-85cb-f222fa15717c">
  
and for baseurl goto github and to the location where your athelete.csv file is stored
select 'Raw' option to get base URL
<img width="948" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/43a71963-857f-4c77-8e3c-3dcbf9f6f92e">
  
<img width="644" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/43600e4b-64f5-4c17-8ff2-355915e9112f">
  
Paste the baseURl and provide authentication type as anonymous to avoid login and click 'create' to get your Linked Service created  
<img width="946" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/0e946a73-e515-4b4d-9c96-f3fc19462853">
  
keep the first row as a header option checked and import schema as none as we dont have any press 'ok'
now move to sink tab, press ' + NEW' and search for data lake and select Azure Data Lake Gen 2
<img width="947" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/fe6cf352-5fb5-4ca0-bddb-7ad293463f07">
  
select CSV
<img width="439" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/b8dd3d9c-5439-4041-8254-18464df82db8">
  
Same likewise for for sink also we need to give a name and create a new linked service
give name of your choice, azure subscription should be free tier and Storage account name should be the name of the storage account you created
<img width="417" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/b59cfc6e-4ef4-4aa3-922a-2ee74d3203bb">
  
keep others as default and press create
click browse to select file type
<img width="413" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/32044fe5-a82f-48db-8ac0-26b5cc9a8651">
  
select the below path
<img width="281" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/09162ffd-972e-487d-8056-0f562f41805d">

Root folder >> olympic-dataset >> rawData
press 'OK'
select import schema to none
give file name at last column of file path
<img width="411" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/2541583a-139e-496e-ae2e-1f68959c0ad6">

click validate to validate the process if it throws up no error then we are good to go
<img width="959" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/fff80d61-0ce1-4baa-b025-60a1ea38c1d9">
  
now you can goto rawdata folder to see atheletes.csv file
<img width="954" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/9a92b299-6fa9-4c96-9069-1baf7953c54d">

repeat the sam process for all other 4 files

once we have ingested all 5 files into datalake storage account 
we have successfully completed our first part ETA i.e., Extraction

<img width="955" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/2aaec566-7aaa-4c58-bc29-da2b78db9140">
  
<img width="952" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/06318ee0-e508-4b78-ac13-098f13f5348c">

6. Azure Data bricks creation:

we will create our Data Bricks first
search for Data bricks and once you are into databricks page select '+ create' to create a data brick
<img width="958" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/ff67d81e-6140-4981-8212-59ea27bae58b">

check for the following
     subscription : free tier
     resource group : same as the previous ones
     workspace name: desired name you wish
     region : nearest region based on yur location
     pricing tier: premium

<img width="676" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/c983832a-64e7-46bf-a55f-f9114a69106e">
proceed to 'review + Create'

data brick sucessfully created
<img width="959" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/b2812de7-4969-42c2-b8c4-a4f3056df21f">

select go to resource
<img width="714" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/9c23416e-4e1c-468b-bf73-9aeef0cc795a">

select launch workspace and you will be redirected to the databrick portal
<img width="931" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/8c7362c7-840f-4fbe-8979-35e50cd4dce6">

The data bricks portal will look like below
<img width="960" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/c51ca1b2-a1ae-485c-8be5-871e7d2b806f">

learn more details about data bricks on : https://azure.microsoft.com/en-in/products/databricks

now select 'compute' option on the left hand side and select 'create compute' option
![image](https://github.com/NoobSura/PortfolioProject/assets/80252306/e161a487-888e-478f-aa35-a967b242b640)

Keep everything as it is in default and click create
<img width="833" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/87511d51-b80a-4073-9815-383b12c90b74">

Once your compute resource is created, you can view it in compute tab
<img width="953" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/6730b7bb-17af-44c9-8570-a68e09b6e6e9">

Now that the compute power to run out code is created we will proceed to create notebooks to write codes to perform transformation.

select 'New' and select 'notebook'
<img width="626" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/5ba12bea-ceb5-4976-bbae-a531c689604f">

select connect option on the right top to connect to your cluster
<img width="953" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/5944f798-a561-4d4b-9426-935c1528f293">

Rename the file according to your likings
<img width="466" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/d4c82891-a671-4086-8c70-719f5650478a">

7. Mount data Bricks to the data lake:

Once we have created compute and notebooks in data bricks, we need to mount our storage account to data bricks to get data

Go to Azure Portal, search App registrations and select the first option

select new registration
<img width="954" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/051ef887-fb85-4dca-bd95-499e1482e599">

Provide a name of your liking, keep others as default and proceed to register
<img width="475" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/5062f80d-3d37-4af0-8903-40bf86f00da6">

once the app registration is complete, note the Directory (tenant) ID, and application (client) ID
![image](https://github.com/NoobSura/PortfolioProject/assets/80252306/c5cd2b00-52e2-4de7-8dc8-a753d3d7418a)

Go to certificate and secrets and create secret key and add it
<img width="957" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/8bbb26d9-1bb9-4b04-9b27-76929627fe3f">

make note of the value
<img width="755" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/da2bdb6b-bbb1-4a09-8ba9-273bbc188bf1">

now we can code configuration code to mount and authenticate

the code is in : [https://learn.microsoft.com/en-us/azure/databricks/dbfs/mounts](https://learn.microsoft.com/en-us/azure/databricks/dbfs/mounts#:~:text=Run%20the%20following,%2C%0A%20%20extra_configs%20%3D%20configs))https://learn.microsoft.com/en-us/azure/databricks/dbfs/mounts#:~:text=Run%20the%20following,%2C%0A%20%20extra_configs%20%3D%20configs)

configs = {"fs.azure.account.auth.type": "OAuth",
          "fs.azure.account.oauth.provider.type": "org.apache.hadoop.fs.azurebfs.oauth2.ClientCredsTokenProvider",
          "fs.azure.account.oauth2.client.id": "<application-id>",
          "fs.azure.account.oauth2.client.secret": "<secret key value>",
          "fs.azure.account.oauth2.client.endpoint": "https://login.microsoftonline.com/<directory-id>/oauth2/token"}

# Optionally, you can add <directory-name> to the source URI of your mount point.
dbutils.fs.mount(
  source = "abfss://<container-name>@<storage-account-name>.dfs.core.windows.net/",
  mount_point = "/mnt/<mount-name>",
  extra_configs = configs)



replace the above code with the noted value
<application-id> : application (client) ID
<secret key value> : secret key value
<directory-id> : Directory (tenant) ID


<container-name> : container name
<storage-account-name> : storage account name
<mount-name> : any name you like


Before proceeding to execute this, goto to storage account >> container >> IAM
and provide permission to data brick to access the data via app registration.

<img width="939" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/52f5d261-42cc-4e18-b8bf-d1f641cdcd82">

select role assignment
<img width="347" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/6d33fecc-19fc-4531-a82d-e0a36779ec07">

Search Blob and you will find a role called Storage Blob Contributor. Click Next.
<img width="898" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/3490e70d-309b-4da5-97b0-7f0026f4b8ab">

You will be headed to role assignment tab
<img width="820" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/45fb5e28-7635-4b19-9e6e-eeabeaad407a">

click Select Members, search for your app name and select that
<img width="945" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/3a62e418-f245-4c31-8422-9d2bc2b31aac">

Keep everything else as default and click next until you see review + Assign and select it
you have successfully provided access

now run the command in the Data Bricks notebook

once the command is successful, you can verify whether the mount is working with the below command

%fs
ls /mnt/olympicMount

<img width="777" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/5f0ff13c-0925-4f98-a119-dc1f80e9fccd">

Note: since data bricks already has sparks session initiated there is no need of starting spark session separately
you can verify it by running the code 

spark

<img width="772" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/52979f4c-7813-4742-a601-8b576571f856">

<img width="465" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/ec9131b1-352f-4b13-a3f0-4f8097fd8020">

8. Load CSV into Data Bricks
Load athlete.csv data into a variable athelete using the below syntax

<img width="460" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/03efa316-7223-43ba-8b85-2ee8f67d4031">

I used the following code
athelete = spark.read.format("CSV").load("/mnt/olympicMount/rawData/atheletes.csv")

and you can view the data using the below code

athelete.show()

<img width="335" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/07b56776-e3dc-40ab-8d02-12f66f8ad5c4">

to include header, slightly modify the code
atheletes = spark.read.format("CSV").option("header","true").load("/mnt/olympicMount/rawData/atheletes.csv")
<img width="343" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/94e2d0b9-d33e-4f0c-b137-4c2d82d84dd7">

repeat it for all 5 csvs
atheletes = spark.read.format("CSV").option("header","true").load("/mnt/olympicMount/rawData/atheletes.csv")
coaches = spark.read.format("CSV").option("header","true").load("/mnt/olympicMount/rawData/coaches.csv")
entriesgender = spark.read.format("CSV").option("header","true").load("/mnt/olympicMount/rawData/entriesgender.csv")
medals = spark.read.format("CSV").option("header","true").load("/mnt/olympicMount/rawData/medals.csv")
teams = spark.read.format("CSV").option("header","true").load("/mnt/olympicMount/rawData/teams.csv")

once we have loaded all the CSV no we can go with the transformation part

9. Transform Data
First, we will check for the data type
to check datatype, use the following code:

atheletes.printSchema()
<img width="477" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/90c21783-0f3f-4411-a64e-3dd3fc2134a3">

Like wise check for all 5 data

and now for gender change the male, female count and total to integers from strings.
<img width="203" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/259e8bf6-1d91-48d3-8b70-e6550a735860">

import the following before execution:
from pyspark.sql.functions import col
from pyspark.sql.types import IntegerType, DoubleType, BooleanType, DataType

https://learn.microsoft.com/en-us/answers/questions/813039/how-to-change-the-column-datatype-of-a-delta-table

<img width="416" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/8dc9445b-6ae8-4164-8d14-5be481a5b1a4">

df = df.withColumn("id", col("colname").cast("newdatatype")) # changes a column datatype.

entriesgender = entriesgender.withColumn("Female", col("Female").cast(IntergerType())\
    .withColumn("Male", col("Male").cast(IntergerType())\
    .withColumn("Total", col("Total").cast(IntergerType())\

entriesgender.printSchema()
<img width="223" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/9a5cdc33-f339-4fb4-bd33-8b0926dad4ac">

we can also follow an alternate, i.e., we can ask spark to compare the schema while loading itself

<img width="463" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/d4e72456-c821-4129-a2c5-63bbaaa1863f">

entriesgender = spark.read.format("CSV").option("header","true").option("inferScheme","true").load("/mnt/olympicMount/rawData/entriesgender.csv")

Now lets try to play around with it

#sorting the atheletes by country name in ascending order
AtheleteCountryAscendingOrder = atheletes.orderBy("Country", ascending=True).show()

<img width="464" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/a947df7e-2e75-463f-b4e0-733098e09f58">

# Calculate the percentage of entries by gender for each discipline
PercentageOfMaleFemale = entriesgender.withColumn('Female%', entriesgender['Female']*100 / entriesgender['Total']).withColumn('Male%', entriesgender['Male']*100 / entriesgender['Total'])
PercentageOfMaleFemale.show()
<img width="744" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/1b0b9ce3-71bf-4dcd-bf52-2a2e518591dd">

# Calculate the percentage of entries by gender for each discipline
PercentageOfMaleFemale = entriesgender.withColumn('Female%', entriesgender['Female']*100 / entriesgender['Total']).withColumn('Male%', entriesgender['Male']*100 / entriesgender['Total'])
PercentageOfMaleFemale.select("Discipline", "Female", "Male", bround("Female%", 1),bround("Male%", 1)).show()
<img width="756" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/01249235-622a-4723-affa-30b8fa8db585">

# Find the top countries with the highest number of gold medals
top_gold_medal_countries = medals.orderBy("Gold", ascending=False).select("Team_Country","Gold").show()
<img width="574" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/6e50fd20-4ba6-4ad2-b5a2-518bf1c1fdaa">

10. Send transformed data back to second storage
we will send the transformed data into transformedData storage folder
<img width="761" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/44344b57-2268-4175-9555-7679369b7fab">

atheletes.write.mode("overwrite").option("header", "true").csv("/mnt/olympicMount/transformedData/atheletes")

<img width="953" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/7e9c1734-4915-485a-bd41-faed4ced6cc6">

11. synapse setup
search for Synapse, select Azure Synapse Analytics and select '+ Create'
<img width="737" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/cd11a70b-547d-4091-9c10-8a9dd91268c2">

create as follows:
Subscription: Free trial
Resource group : your resource group name
workspace name :  name of your choice
region : nearest region
select your storage acc name and its dataset name
<img width="676" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/0182cf0e-297a-4615-8540-d7200c23c866">

keep others as defaults and go to review + create

Once it is deployed go to resource group 
<img width="686" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/a32da51a-a8c7-4a41-9726-4be41eefc20e">

you can see all your your previous resources listed
<img width="865" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/fd3cdf2d-be8e-4a17-9b1f-5b1c9702a6d1">

Select your Synapse account, and it will open a new page where you need to select 'Open Synapse Studio'.
you will be redirected to a new page.
<img width="706" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/3a64f2e3-5d00-452e-a85a-3a6d3d1babb1">

<img width="795" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/7015940f-a219-45d1-a8d2-0b4452557fd3">

goto data >> + >> lake database
<img width="594" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/299b8234-b5b9-4999-b928-e451dde01302">

name your database and select + table 
select from data lake.

name your database and select linked services
<img width="960" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/84160464-e8c7-4375-8894-ac97d752d192">

for file location, click browse storage account >> transformed data folder >> athelete >> select file with the name part00..
<img width="456" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/e5b9ea86-d9d1-42cf-8526-6e6cc0eb395a">

Proceed with continue
It will lead to New External Table tab
where keep the below
Field Terminator : Default (comma,)
first row: check the infer column name
string delimiter: Default (empty string)
Use Default type: Default type (true, False)
Max String Length: 4000

<img width="454" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/81c34b31-6e99-4f15-9698-6e8a01612931">

<img width="454" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/287ff500-9110-4e19-9cc8-c3b8645321b9">

Check whether the relationships are right 
<img width="877" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/9e171bc9-60e6-49ff-9c95-918b0475ffd0">

If everything is right, click validate all, and once validated, click publish.
<img width="904" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/924b0e26-33d6-4bb8-a90a-2bee86dfbd3b">

Once the table is published, go to data tab to verify if the table is published. If you don't see the table kindly refresh
<img width="520" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/41af741a-848e-4a2f-bffb-32ee3687fb81">

once on successful table creation is complete, create tables for remaining data and publish it

you can verify click the ... near any table >> new SQL script >> select top 100 rows
<img width="939" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/16a36fa8-dd53-4bae-a56c-92fa002dd766">

click run to verify
<img width="458" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/f6492303-66b1-4c52-99e3-52d7d465c078">

I have attached the spark code link for reference.





  













    

    



