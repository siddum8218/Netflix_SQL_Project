# 🎬 Netflix movies and tv shows data analysis using SQL.

![Netflix_logo](https://github.com/siddum8218/Netflix_SQL_Project/blob/main/Logo.jpg)

## 📌 Overview  
This project analyzes the **Netflix dataset** using **SQL** to solve real-world business problems.  
The dataset includes details such as movies, TV shows, cast, directors, release years, ratings, durations, genres, and descriptions.  

The project contains:  
- ✅ Database schema for Netflix content  
- ✅ 15 business problems and their solutions using SQL  
- ✅ Cleaned dataset for practice and analysis  


## 📂 Project Structure  

```bash
📦 Netflix-SQL-Project
├── 📄 Netflix_Dataset.csv      # Dataset used for analysis
├── 📄 Schema.sql               # Database schema creation
├── 📄 Problems.sql             # 15 Business Problems (questions)
├── 📄 Solutions.sql            # SQL queries solving the problems
├── 📄 Logo.jpg                 # Project logo
```

## 🗄️ Database Schema

```sql
CREATE TABLE netflix (
    show_id       VARCHAR(5),
    type          VARCHAR(10),
    title         VARCHAR(250),
    director      VARCHAR(550),
    casts         VARCHAR(1050),
    country       VARCHAR(550),
    date_added    VARCHAR(55),
    release_year  INT,
    rating        VARCHAR(15),
    duration      VARCHAR(15),
    listed_in     VARCHAR(250),
    description   VARCHAR(550)
);
```
## 📝 Business Problems

This project addresses **15 business questions**, such as:  

- Count the number of Movies vs TV Shows  
- Find the most common rating for movies and TV shows  
- List all movies released in a specific year  
- Find the top 5 countries with the most content  
- Identify the longest movie  
- Find content added in the last 5 years  
- Find all movies/TV shows by a specific director  
- List all TV shows with more than 5 seasons  
- Count the number of content items in each genre  
- Average yearly content released in India  
- List all documentaries  
- Find all content without a director  
- Find how many movies actor *Salman Khan* appeared in during the last 10 years  
- Top 10 actors in Indian movies  
- Categorize content as **Good** or **Bad** based on keywords in the description  


## 🛠️ Tech Stack
- SQL (PostgreSQL)  
- CSV Dataset for Netflix content  

