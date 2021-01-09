# Databases 2 Optional Project
> A.Y. 2020 // Group 67 // Danelutti, Di Dio Lavore, Franchini

IntelliJ project with source code for the Databases 2 class optional project.
The purpose is to deploy a Java EE application with a MySQL database.

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