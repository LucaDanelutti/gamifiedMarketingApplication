# A marketing application with JEE and JPA
> DataBases 2 class project A.Y. 2020-2021 // Group 67 // Danelutti, Di Dio Lavore, Franchini

IntelliJ project with source code for the DataBases 2 class optional project A.Y. 2020-2021.
The purpose is to deploy a Java EE application with a MySQL database.

## Functional specifications
An application deals with gamified consumer data collection. A user registers with a username, a password and an email. A registered user logs in and accesses a HOME PAGE where a “Questionnaire of the day” is published.
The HOME PAGE displays the name and the image of the “product of the day” and the product reviews by other users. The HOME PAGE comprises a link to access a QUESTIONNAIRE PAGE with a questionnaire divided in two sections: a section with a variable number of marketing questions about the product of the day (e.g., Q1: “Do you know the product?” Q2: Have you purchased the product before?” and Q3 “Would you recommend the product to a friend?”) and a section with fixed inputs for collecting statistical data about the user: age, sex, expertise level (low, medium high). The user fills in the marketing section, then accesses (with a next button) the statistical section where she can complete the questionnaire and submit it (with a submit button), cancel it (with a cancel button), or go back to the previous section and change the answers (with a previous button). All inputs of the marketing section are mandatory. All inputs of the statistical section are optional.
After successfully submitting the questionnaire, the user is routed to a page with a thanks and greetings message.
The database contains a table of offensive words. If any response of the user contains a word listed in the table, the transaction is rolled back, no data are recorded in the database, and the user’s account is blocked so that no questionnaires can be filled in by such account in the future.
When the user submits the questionnaire one or more trigger compute the gamification points to assign to the user for the specific questionnaire, according to the following rule:
  * One point is assigned for every answered question of section 1 (remember that the number of questions can vary in different questionnaires).
  * Two points are assigned for every answered optional question of section 2.

When the user cancels the questionnaire, no responses are stored in the database. However, the database retains the information that the user X has logged in at a given date and time.
The user can access a LEADERBOARD page, which shows a list of the usernames and points of all the users who filled in the questionnaire of the day, ordered by the number of points (descending).
The administrator can access a dedicated application on the same database, which features the following pages:
* A CREATION page for inserting the product of the day for the current date or for a posterior date and for creating a variable number of marketing questions about such product.
* An INSPECTION page for accessing the data of a past questionnaire. The visualized data for a given questionnaire include:
    * List of users who submitted the questionnaire.
    * List of users who cancelled the questionnaire.
    *  Questionnaire answers of each user.
* A DELETION page for ERASING the questionnaire data and the related responses and points of all users who filled in the questionnaire. Deletion should be possible only for a date preceding the current date.

## Setup

You'll need to download the following tools:
- [TomEE](https://tomee.apache.org/download-ng.html)
- [MySQL](https://dev.mysql.com/downloads/)
- [Connector/J](https://dev.mysql.com/downloads/connector/j/) (choose the _Platform Indipended_ version)

1. Clone this repository
```shell
git clone https://github.com/LucaDanelutti/db2-2020-Danelutti-DiDioLavore-Franchini
# or
gh repo clone LucaDanelutti/db2-2020-Danelutti-DiDioLavore-Franchini
```
2. Download and uncompress [TomEE](https://tomee.apache.org/download-ng.html) somewhere
3. Download and install [MySQL](https://dev.mysql.com/downloads/)
4. Open the project folder with _IntelliJ IDEA Ultimate_
5. In the menu bar, _Run > Edit Configurations..._
6. Click '+' in the top left and select _TomEE Server > Local_
7. If needed, click _Configure..._ (beside _Application Server_) and point to the _TomEE_ folder
8. Select a _TomEE_ version
9. Leave everything else on default settings
10. In the _Deployment_ tab, under _Deploy at the server startup_ click '+' and select _Artifact..._ and choose the one ending with _":war exploded"_
11. Click _Apply_
12. If you haven't configured MySQL yet, do it now and take note of the credentials
13. Create a schema called `marketing_application`
14. In _IntelliJ_ navigate to _View > Tool Windows > Database, click '+' and select _Data Source > MySQL_ and fill in with your database connection credentials
15. In _Database_ field, specify `marketing_application` and test the connection
16. Click _Apply_
17. In the _Database_ panel, select _marketing_application_ under your database, right click and select _Run SQL script..._
18. Select `sql-dump/marketing_application.sql` and run it
19. Navigate to the TomEE folder, and open `conf/tomee.xml`
20. Between the `<tomee>...</tomee>` tags, add the following code, replacing _SERVER_, _USERNAME_ and _PASSWORD_ with the credentials the application will use to connect to the database
```xml
  <Resource id="MarketingApplicationDB" type="DataSource">
    JdbcDriver com.mysql.cj.jdbc.Driver
    JdbcUrl jdbc:mysql://SERVER:3306/marketing_application
    UserName USERNAME
    Password PASSWORD
  </Resource>
```
22. Download [Connector/J](https://dev.mysql.com/downloads/connector/j/), uncompress it and drop _mysql-connector-java-<version>_ in _<TomEE Directory>/lib_

### Test setup

1. Run the server with _Shift + F10_ (or click the green play button); if it's not clickable, close and reopen _IntelliJ_
2. Once the browser opens, try logging in with username `user1` and password `user`
3. If the setup was successful, you'll see a welcome page. If you get a 404 error page you probably didn't setup _tomee.xml_ at step 20; if you can't get the server to load, you probably haven't installed _TomEE_ or _Connector/J_ correctly.
