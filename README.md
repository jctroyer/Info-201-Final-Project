# **INFO201 FINAL PROJECT | Technical Report**  

**Project Code Name:** Global Terrorism  
**Authors:** Joseph Altamira, Jazmynn Combes-Troyer, Dorothy Lu

**Affiliation:** Info-201: Technical Foundations of Informatics  
The Information School  
University of Washington  
Autumn 2019  

## 1.0 INTRODUCTION PROBLEM SITUATION  
### 1.1 Problem Situation:

Terrorism is the unlawful and systematic use of violence against a state, country, or group of people, motivated by various ideologies, as a form of political coercion. Global acts of terrorism have impacted hundreds, thousands, and millions of people throughout history in social, economic, and political ways. 

### 1.1.1 Setting:

Terrorism occurs on local, national, and international levels. Take - for instance - the white supremacist attack at the "Unite the Rally" attack in 2019, which occurred on US soil in Charlottesville, VA by Americans. This act of terrorism occurred on a more local level. Another example is the infamous al-Qaeda attack on the USA on September 11, 2001, which was a national terrorist attack. On an international level, one can look back on World War II and the Holocaust, which mainly targeted Jewish populations in Western Europe.   
Terrorism is a result of political, religious, and other ideological tensions as well as differing fundamental values between different groups of people. This may include and affect political policies (regarding national security, political interference with other states and nations, and use of military forces) and humanitarian ethics (for example, those ethics and policies imposed and established by the United Nations).   

### 1.1.2 Stakeholders

Direct stakeholders include political entities (i.e. a government, political figure, or organization), both as targets and instigators. As instigators, political entities plan and execute attacks against other states, nations, other political groups, or specific political figures to further some political, religious, or other ideological objective. As targets, these political entities suffer damage from their attackers which may include death, injury, and political and economic harm.
Indirect stakeholders include civilians residing in or around the targeted person, group, or nation. These civilians are typically citizens of a state and are not direct or intended targets. Civilians may suffer personal loss via death or injury of themselves or loved ones as well as property damage or socioeconomic difficulties that may result from damage sustained from main stakeholders (such as governments or major political leaders).

### 1.1.3 Values and Tension: 

The typical values and tensions that drive terrorism involve disagreements in religious, political, and economic perspectives. Although the target types (i.e. individual, government, organization) of terrorist attacks are fairly diverse, it seems that a large percentage of attacks target governments and private property. These attacks cause government workers and general populations with a significant form of capital (money) fear for their well-being, which ultimately affects their quality of life. 

### 1.1.4 General Issues

The general issues at stake are the health and well-being of individuals in terror-stricken countries. Terrorism is an extreme way of expressing a political disagreement and affects individuals, communities, and societies on multiple levels. Aside from the obvious physical and psychological impacts on direct victims, terrorism causes deep-rooted fear and insecurity within affected populations. These feelings of fear and insecurity can lead to larger 

### 1.1.5 Policy and Ethics

Terrorism is a result of political, religious, and other ideological tensions as well as differing fundamental values between different groups of people. This may include and affect political policies (regarding national security, political interference with other states and nations, and use of military forces) and humanitarian ethics (for example, those ethics and policies imposed and established by the United Nations). Current policies in place can also drive acts of terrorism as some ideological groups may disagree with those policies and execute acts of terrorism as a way to express their dissent and push their own ideological agendas. 

### 1.2 What is the Problem?

Acts of terrorism are violent and often ineffective ways of furthering a political or ideological agenda. Hundreds, thousands, and even millions of innocent civilians suffer as a result of terroristic attacks (i.e. the Boston Marathon Bombing, 9/11, the Pulse Nightclub shooting in Orlando, etc.). In addition to civilian casualties, terrorism causes political unrest within the targeted population's government and people. This can cause instability, thus resulting in economic, social, and political deterioration. Furthermore, terrorism can have a significant impact on international relations, as we have seen with the United States and middle eastern countries like Iraq and Afghanistan.

### 1.2.1 Why Does It Matter?

Terrorism affects individuals, communities, and societies on multiple levels. Aside from the obvious physical and psychological impacts on direct victims of terrorism, terrorism causes deep-rooted fear and insecurity within affected populations. This uncertainty for safety also has direct effects on the economy (both direct economic destruction and market uncertainty) to the political health of the State. This political unrest could lead to more violence and further instability, which could be more dangerous for innocent civilians and result in international repercussions as those civilians could potentially try to immigrate. In short, terrorism has great political, economic, and humanitarian impacts on targeted populations.

### 1.3 How Will it be Addressed?

The sensitive subject of terrorist attacks will be addressed by bringing attention to the underlying issues that bring forth terrorism and its subsequent political violence. By understanding the root causes and finding correlations between various data about those attacks (date, location, cause, etc.), we can raise awareness and educate the public about various aspects of terrorism and about targeted regions that are not widely publicized by the media. This could potentially help with prevention and perhaps lower the severity of the attacks around the world.

### 1.3.1 Data Wrangling and Info Viz

Our main dataset is very robust, it contains a ton of information on the immense number of terror attacks throughout the years. We will be shaving down the data to include columns that are deemed to be important for the data visualizations created. This means we will most likely not use columns that use strings as an input so those will be selected. Extremes will be found using functions in dplyr. Along with extremes, we will display all attacks on a map for our information visualization. This data visualization will help explain that terrorism is not as rare as people think.

### 1.3.2 Intended Audience

Our audience will most likely be government officials, and those that use terrorist attacks in their field of work, ex: journalism. However, it can be used by most anyone. Our goal is to be able to bring about a discourse about this issue, instead of something that is so taboo to talk about. Seeing it in a light where people’s emotions aren’t manipulated like what journalism tries to do.

### 1.4 Previous Work
There are multiple existing organizations, researchers, and 


### 1.5 Building on Previous Work


### 1.6 Who Cares?


### 1.6.1 Why Do Others Care?


### 1.6.2 We Care


## **2.0 Research questions **


## **3.0 The Data Set(s)** 

The dataset that will be used throughout this project is called  “Global Terrorism Database” from kaggle.com. It lists over 180,000 terrorist attacks from 1970 to 2017. The GTD contains more than 100 variables, using information from media outlets/articles that are not classified. However, the current data is too large for github so we took off certain rows (years we are not using) and columns that we will not be the main focus of our project. 


### 3.1 About the Data Set

(1) Who created it? 

- “The database is maintained by researchers at the National Consortium for the Study of Terrorism and Responses to Terrorism (START), headquartered at the University of Maryland”
Along with the Pinkerton Global Intelligence Service (PGIS)

(2) Why was it created? 

- It was created to identify the risk of terrorism for clients of the PGIS. 

(3) Where did you access it? 

- The dataset can be accessed from https://www.kaggle.com/START-UMD/gtd or https://data.world/data-society/global-terrorism-data

(4) What represents an “observation”? 

- An observation is a documented terrorist attack. This can come from a wire service, government reports, and major international papers. 

(5) What “variables” does each observation have? 

- There are over 100 variables. The top three we are most interested in are casualties, target of attack, and type of attack.

(6) How big is the data set? If it is a subset of a larger data set, how was the sub-set created? 

- Massive. Well over 180,000 recorded data. Each observation having more than 100 variables to describe the events.

(7) If the data set represents people, who has been included and who has been excluded?

- Included: Those impacted by an attack, such as private land-owners, government officials, and civilians. 

- Excluded: There are some countries that do not have a high number of attacks, it is possible for them to be excluded on the sole fact that they did have any observations that are recorded.

### 3.2 Data Set Strengths and Weaknesses

You employ the envisioning cards to clarify the strengths and weaknesses of the data set(s). You describe the strengths and weaknesses of the data set. 

### 3.3 Data Wrangling

_Please refer to 1.3.1:_
“We will be shaving down the data to include columns that are deemed to be important for the data visualizations created. This means we will most likely not use columns that use strings as an input so those will be selected. Extremes will be found using functions in dplyr”. The columns we are most interested in are casualties, types of attacks, and targets of the attacks. 

### 3.4 Refer to Appendix

See Appendix 1: Data Dictionary. 

## 4.0 Information visualizations 

**Map**
For our first Information visualization we decided to do a map. We are fairly familiar with how to code a map in leaflet, creating a shiny app will not be as difficult

## **5.0 Technical Description of Shiny Application** 

### 5.1 Loading the Data

The datasets used are loaded in a .csv file. 
Certain data were selected and filtered, and were put into a shape (.shp) file. This shape file is used to create the world map and to determine the borders of each country. If a user clicks on a country it will display the statistics for that data. The data in the set is then used by leaflet to determine which area of the map will display which information. 

### 5.2 Libraries Used

Leaflet is used to create the map and the popup widget that displays information about terror attacks in different areas of the world. 
Dplyr is used to trim and wrangle the data such that only relevant columns are displayed in the data set. It is also used to select and filter certain columns and rows to obtain specific information for the leaflet popups. 
Shiny is used to create the UI and server. 
ggplot2 is a supporting library to format various elements of the map. 

### 5.3 Organization of Code

The code is organized similarly to a5. The home directory contains a data folder, an R file which holds the data, another R file that holds the analysis needed for the map and the map popups. 

### 5.4 Questions to Answer and Explore

What questions, if any, will you be answering with statistical analysis/machine learning? 
How many people are affected by various attack types? (Measured by number of casualties, injuries, property damage)
Which attack types are most prevalent in different countries? 
At a glance, which area of the world seems to be impacted most by terrorist attacks? 
What groups of people are most affected or most targeted by terrorist attacks?

## **6.0 Conclusion**

### 6.1 Strengths and Weaknesses


### 6.2 Main Lessons Learned
Main lessons that you learned

### 6.3 Future Work
The future work that you or someone else might pursue. 


### Acknowledgements 

We wish to acknowledge the help provided by Benjamin Xie in the development of this project.

### References 

Cato Institute. (2017). Cato 2017 Human Freedom Index (Version 3). [Data File]. Retrieved from https://www.kaggle.com/doyouevendata/cato-2017-human-freedom-index#cato_2017_human_freedom_index.csv
Data Society. (2016). Global Terrorism Data. [Data File]. Retrieved from https://data.world/data-society/global-terrorism-data/contributors
Institute for Economics & Peace. (2018). Retrieved from http://visionofhumanity.org/indexes/terrorism-index/
Loayza, N. (2016, July 29). How to defeat terrorism: Intelligence, integration, and development. Retrieved from https://www.brookings.edu/blog/future-development/2016/07/25/how-to-defeat-terrorism-intelligence-integration-and-development/.

### Appendix 1: Data Dictionary 

In this appendix you should describe the variables that make up your data set, including: The name of the variable, a description of its meaning, the data type, and the measurement type. A suggestion format is a table such as this: Variable Name Description Data Type Measurement Type … … … … 


### Appendix 2: Reflections 

In this appendix each team member should write a personal reflection on the project [> 150 words]. Topics might include: What you learned, what you found satisfying/frustrating, what you would do differently in the future, how the project positioned you develop your identity for coder, thinker, and innovator, and so forth. 
Joseph: 
Jazmynn: 
Dorothy:  So far, this project has been both immensely challenging and fun. Though I was constantly frustrated with the long (and still currently ongoing) process of debugging, I feel like my self-teaching skills are one of my skills that have greatly increased.  Because I encountered many more roadblocks creating our map than I thought I would, I ended up doing a lot of research into Shiny data visualizations (specifically maps), allowing me to learn about things such as .shp files which I hadn’t encountered before.  Additionally, I think this stage of the project has allowed me to enjoy coding much more, as I really enjoy being able to see a visual product of all the work we’ve been doing and I also feel much more confident in R. In the future, I will try to have a deeper understanding of the code and the underlying processes before using them in a project, as it would definitely allow understanding errors in the output much easier.  This portion of the project has definitely helped me develop my identity as a thinker and coder and allowed me to be more confident in tackling coding issues that I don’t know.

### Appendix 3: Use of Envisioning Cards 

The envisioning cards were used to discuss the direct and indirect stakeholders involved in global terrorist attacks, the social and ethical implications of the problem, and 
Direct/Indirect Stakeholders
