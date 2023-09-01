<img width="482" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/c57f31e0-50de-4d63-bdd9-592dd2b5190c">This is a simple ETA (Extract Transform Analyze) Portfolio of the sample olympic data from Kaggle using Microsoft Azure platform and Apps.

Apps used in this project includes
* Kaggle ( for data set)
* Azure Data Facories ( For data ingestion)
* Azure Data Lake (For storing data)
* Azure Data Bricks ( to transform data)
* Azure Synapse Analaytics ( to analyse data)
* Tableau ( to visualize data)

The flow goes as below
# Dataset from Kaggle >> Azure Data Factories >> Azure Data Lake - 1 >> Azure Data Bricks >> Azure Data Lake - 2 >> Azure Synapse Analaytics >> Tableau

Note:
This project can be executed just with any one of the Azure apps mentioned above but for the educational understanding of all the apps I am doing it with individual apps 
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
  now click source tab to extract our athelete data from github
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

  6. Begin transformation with Azure Data bricks
     we will create our Data Bricks first
     search for Data bricks and once you are into databricks page select '+ create' to create a data brick
     <img width="958" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/ff67d81e-6140-4981-8212-59ea27bae58b">

     check for the following
     subscription : free tier
     resource group : same as the previous ones
     workspace name: desired name you wish
     region : nearest region based on yur location
     pricind tier: premium

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

     Keep everything as it is in default and clicl create
     <img width="833" alt="image" src="https://github.com/NoobSura/PortfolioProject/assets/80252306/87511d51-b80a-4073-9815-383b12c90b74">

 
 
 















  













    

    



