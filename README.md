## 🏅 Analyzing Olympic Games Dataset with SQL
This project explores the Olympic Games dataset, analyzing participation trends, medal distributions, and the evolution of the Olympics over time.
<br><br>
Dataset used: [Olympic Games Dataset in Kaggle](https://www.kaggle.com/datasets/heesoo37/120-years-of-olympic-history-athletes-and-results)
<br><br>
## 📘 Overview
The goal of this project is to conduct data exploration, aggregation, and growth analysis to uncover how the Olympics have expanded globally over time.
<br><br>
## 🧠 Key Insights
- 🌍 The number of participating nations increased significantly after 1980, reflecting the growing global reach of the Olympics.
- ☀️ The Summer Olympics consistently have more participants than the Winter Olympics.
- 🇺🇸 The USA earned the most total medals overall.
- 🇵🇭 The Philippines earned most of its Olympic medals in Boxing.
- 🏏 Sports such as Aeronautics, Basque Pelota, and Cricket were featured only once in the Olympics.
- 🥇 Charles Jacobus and Oscar Swahn were the oldest athletes to win a gold medal.
- 🏊‍♂️ Michael Fred Phelps II holds the record for winning the most gold medals in Olympic history.
<br><br>
## 🧩 SQL Techniques Used
- CTEs (Common Table Expressions): For modular and readable query building
- JOIN operations: To combine athlete and region data
- Window functions: Utilized SUM(), OVER(), and RANK() for running totals and rankings
- Aggregation functions: Used COUNT(DISTINCT) and MAX() for summarizing data
- Filtering and ordering: Applied WHERE, ORDER BY, and subqueries for precise analysis
<br><br>
## 💡 Example Query
```sql
WITH athlete_region AS (
    SELECT *
    FROM athlete_event
    JOIN region
    ON athlete_event.noc = region.noc
), participant_cte AS (
    SELECT
        games, 
        season,
        COUNT(DISTINCT region) AS total_participants
    FROM athlete_region
    GROUP BY games, season
) 
SELECT 
    games,
    season,
    total_participants,
    SUM(total_participants) OVER(PARTITION BY season ORDER BY games ASC 
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS rolling_total_participants,
    COALESCE(ROUND(
        ((total_participants::numeric - LAG(total_participants) OVER(PARTITION BY season ORDER BY games)::numeric)
        / NULLIF(LAG(total_participants) OVER(PARTITION BY season ORDER BY games)::numeric,0))*100, 2
    ), 0) AS growth_rate_in_pct                      
FROM participant_cte
ORDER BY games;
```
<br><br>
## ⚙️ Tools Used
- PostgreSQL
- VS Code (SQL extension)
- Kaggle dataset
<br><br>
## 📂 Repository Structure
```pqsql
Analyzing-Olympic-Games-Dataset-with-SQL/
│
├── dataset/                    # Dataset files used for this project
├── query/
│   ├── preprocessing/          # Scripts for data cleaning and preparation
│   ├── EDA/                    # EDA queries
├── README.md                   # Project documentation
└── sample_outputs/             # Screenshots or result tables
```
<br><br>
## 🧑‍💻 Author
Gelo (Ryan Dela Cruz)

Data Analyst skilled in SQL, Python, and Excel

📊 Exploring data through real-world projects and insights
 <br><br>
## ⭐ Acknowledgments
Dataset by [heesoo37](https://www.kaggle.com/heesoo37) on Kaggle.

Thanks to the open-source data community for making this analysis possible!

And special thanks to [TechTFQ](https://techtfq.com/blog/practice-writing-sql-queries-using-real-dataset#google_vignette) 
for providing valuable guidance and examples that inspired and refined the SQL analysis in this project.
