# SEMOSS Project 
 
## Welcome 
 
Hello and welcome to the SEMOSS project. We have a few important steps for you to take to initialize the process of downloading SEMOSS. It is a lengthy process, and the goal is for you to be able to set a few parameters and download a few items, and then step away while our automation process does the rest. If you are downloading for the first time, this process could take anywhere from 30 minutes to an hour*. Do not be alarmed if your first installation process takes up your entire day. 
 
For returning SEMOSS users who need to download specific things, please see the properties file section. 

## Installing the Automation Script

In order to get started, you need to download this script onto your machine. Select the green "Code" button and select the "Download Zip" option. Unzip the file into your downloads folder. Access the unzipped folder, and navigate through until you see the file called `master.properties`. Keep this file open and ready to edit as you follow the instructions below. 

## JDK 
 
First things first, we need you to download a Java SE Development Kit (JDK). Through this link: [Oracle JDK Downloads](https://www.oracle.com/java/technologies/javase/javase8u211-later-archive-downloads.html) you can scroll down to find set, Windows x64 for 64 bit. Accept the license agreement and download. You will need to create an Oracle account using your Deloitte email address (if you do not receive an email confirmation within 10-15 minutes, contact a training team member, who will provide a backup email). Select next all the way through; it will go to your Program Files but you won't have to direct it there (if you run into any issues, right click the download and choose "Run as Administrator"). 
 
## Properties File 
 
For our automation to know exactly what you want to download and where you want to download it to, we need you to edit the properties file. This file is called `master.properties`. The purpose of this file is to flag certain software as true or false. A true marker means that the software will be installed, false means that it won’t be installed. The individual software flags only work if _**softwareInstall**_ is true. 

### Workspace Path
For a first time SEMOSS installer, you are going to need to make some changes to the properties file. you can also choose to set your path variable. This is where your workspace within Eclipse would be located. Any installer needs to put their workspace in their C drive. We recommend it to look like this: 

<img width="236" alt="image" src="https://github.com/user-attachments/assets/589c4f03-cadd-4ee5-afc2-e15a1a0e39c2">

The script will automatically make your workspace for you once you fill in this value. If you are creating a different workspace to play around in, pick whatever path you’d like. 

### EclipseLoc

If you are a first time installer, leave eclipseLoc **set to null**. This allows the script to populate the properties file with the correct location as you download Eclipse. You do not need to change anything here.

![image](https://github.com/user-attachments/assets/02c799a8-b458-4a25-a850-a605f1a2b39d)

If you already have the correct version of Eclipse on your machine and are running the automation part, you will need to populate this field as the comment instructs. Here is an example of what that may look like, depending on where Eclipse is downloaded on your machine: 

![image](https://github.com/user-attachments/assets/41d51762-0886-44cd-b6bf-134d2c8314a1)

### Setting Your Flags

As a first time SEMOSS installer, you will need to install all the bells and whistles. All of your flags should be set to "true". See the image below and ensure that your properties file matches it. 

![image](https://github.com/user-attachments/assets/e9bf8464-6707-4a0e-9b23-8c4fcaec0bb4)

Returning SEMOSS installers have the option to play around with these flags. If you already have the correct versions of software on your machine, you may set the "softwareInstall" flag to false. If you need a few to be updated, set it to true and further specify which software you need. 

### GPU

If you have a GPU, change the following flag in master.properties:
```
haveGPU=false
```

### Tomcat Version

If you are not a firt stime installer, you may have a different tomcat version. The default setting in master.properties is
```
Tomcat_Version=apache-tomcat-9.0.96
```
Check your workspace directory and change this variable as needed. For example, if I have the folder apache-tomcat-9.0.93, I would change the properties variable to that.


## Master.bat

In the same location as your properties file, there is a file called `master.bat`. At this point in the instruction, you are ready to run it. Double click on the file and the process should begin. You should expect to see many different command prompt windows opening up.

## VS Installer

VS Installer is something that all new SEMOSS developers need to install. There are a few “user inputs” required to complete the installation. As the `master.bat` file runs this software will install, so be patient for it to open. Find the command prompt window that looks like this: 
<img width="857" alt="image" src="https://github.com/user-attachments/assets/c15873ae-556e-4d49-8330-3e646a705d47">

Click any button in this window. VS Installer will automatically run and open up VS Build Tools. You will be greeted with a screen that looks like this:

![image](https://github.com/user-attachments/assets/a07d5266-98f0-4eab-9b5d-23a65d8e20de)

Click on the ”Modify” button on the right side. There’s a chance that step skips altogether and it takes you straight into the modify screen:

![image](https://github.com/user-attachments/assets/23f97da3-fe67-4ad6-b40b-20984648660e)

Check the box that says ”Desktop Development with C++”. On the right side there is an ”Installation Details” section. Check each checkbox in this Optional section. Download and install the selection.

## Last Steps

At this point, the rest of the installation should be done automatically. Once the process is complete, Eclipse should be launched for you. Be mindful of the fact that Eclipse will launch once early on in the process, it will close itself after 60 seconds, and you must wait until the final launch to start your server.

### Starting your Server

- Please wait until your workspace has finished building to start your server. You can check the progress of your workspace at the bottom right of Eclipse.

![image](https://github.com/user-attachments/assets/60e6cb68-642b-443f-a2dc-2e9f74d5f186)

- Starting the server yourself: At the bottom of Eclipse, next to the Console tab, you should see a tab labeled “Servers”.  Right click on Tomcat and select the “Start” button. Give your server a few minutes to start. You can watch the console’s output as your server starts to view the progress. Once your server has been started, go to this website to start using SEMOSS. [SEMOSS](http://localhost:9090/SemossWeb/#!/)

![image](https://github.com/user-attachments/assets/89d5bc0a-6094-406a-a2e2-7cb005a4e274)

First time SEMOSS installers will be greeted with this page:

![image](https://github.com/user-attachments/assets/22684aff-621d-45ef-a401-2893629b01f5)

Create your login credentials. When you run your server again you should be greeted with this page:

![image](https://github.com/user-attachments/assets/5a7e266a-a7bd-4681-a13e-0e8500bf07aa)
