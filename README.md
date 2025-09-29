StreamMax Media Content Analytics with SQL Window Functions

STEP 1: Problem Definition
Business Scenario
StreamMax Media is a fictional web video streaming website. The Content Analytics team needs to analyze viewing data to identify show popularity, viewer trends, and engagement. For example, they would like to identify most-watched programs by geographic region or quarter, compute cumulative watch time, measure month-over-month change, segment viewers by intensity of engagement, and smooth trends using moving averages. These insights tell StreamMax what to offer, how to personalize local content, and how to boost interaction. Here, each viewer has a region (say North America, Europe), each show has an ID and genre, and each watch event is recorded with a date and watch time.


Data Challenge
Before StreamMax had a proper system, all the viewing records were just raw logs and scattered reports. It was hard to know which shows people watched the most, how much time they spent, or how things changed from month to month. The data was messy and not easy to use for clear decisions.


Expected Outcome
  The system will give clear information on which shows are most popular, how viewing changes over time, and how different groups of viewers watch content.


STEP 2: Success Criteria


Measurable goals
  Rank the top 5 shows by total watch time per region (using RANK()).
  Compute a running total of monthly watch time (using SUM() OVER).
  Calculate month-over-month watch-time changes (using LAG()).
  Assign viewers to quartiles by their total watch time (using NTILE(4)).
  Compute a 3-month moving average of watch time (using AVG() OVER with a frame).
  The queries will give tables with results, and from there we can explain what the numbers mean, look at why the trends happen, and suggest what StreamMax should do next.


STEP 3: Database Schema

Database Scheme
  The database uses three tables:
  Viewers: (viewer_id PK, name, region)  each row is a registered user (with a region).
  Shows: (show_id PK, title, genre)  each row is a video/show available to stream.
  View_Logs: (log_id PK, viewer_id FK, show_id FK, view_date, watch_time)each row is one viewing session.


STEP 4: Window Functions Implementation
 In this part, I used different window functions to analyze the data:
  Ranking – I used ROW_NUMBER(), RANK(), DENSE_RANK(), and PERCENT_RANK() to list the top shows in each region.
  Aggregate – I used SUM(), AVG(), MIN(), and MAX() with frames to see running totals and trends over months.
  Navigation – I used LAG() and LEAD() to compare watch time between months and find growth or drops.
  Distribution – I used NTILE(4) and CUME_DIST() to divide viewers into groups (quartiles) and see how they are spread by total watch time.


STEP 6:  Results Analysis
  Descriptive (What happened): Some shows were watched more in certain regions. Watch time went up in some months and dropped in others. A few viewers watched much more than the rest.
  Diagnostic (Why): The changes happened because of things like new shows, seasons, or regional taste. Drops may be from less new content or timing.
  Prescriptive (What next): Focus on top shows, give special attention to active viewers, and plan better for months when watch time usually drops.


STEP 7:  References
  Oracle. Analytic Functions (Window Functions). https://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/Analytic-Functions.html
  Oracle. ROW_NUMBER, RANK, and DENSE_RANK Functions. https://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/ROW_NUMBER.html
  Oracle. LAG and LEAD Functions. https://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/LAG.html
  Oracle. NTILE and CUME_DIST Functions. https://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/NTILE.html
  Oracle. Aggregate Functions (SUM, AVG, MIN, MAX). https://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/Aggregate-Functions.html
  Mode Analytics. SQL Window Functions Tutorial. https://mode.com/sql-tutorial/sql-window-functions
  DataCamp. SQL Window Functions Explained: Ranking, Aggregates, and More. https://www.datacamp.com/tutorial/sql-window-functions
  GeeksforGeeks. SQL Window Functions. https://www.geeksforgeeks.org/sql-window-functions
  Vertabelo. Introduction to SQL Analytic Functions. https://vertabelo.com/blog/sql-analytic-functions
  W3Schools. SQL Window Functions. https://www.w3schools.com/sql/sql_window_functions.asp
