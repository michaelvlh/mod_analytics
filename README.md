# Mod Analytics Project – Nexus Mods Style

## Overview

This project demonstrates **end-to-end analytics engineering** for a video game modding platform, inspired by real-world data from platforms like **Nexus Mods**.  

It simulates user events (viewing, downloading, uploading, and liking mods) and builds a **dbt-based analytics pipeline** to produce business-critical insights.

The project showcases:

- Data generation and seeding
- Staging and fact table models
- Event-based aggregations
- Sessionisation logic
- Data quality tests

---

## Project Structure
mod_analytics/
├── seeds/
│ └── events.csv # Simulated raw event data
├── models/
│ ├── staging/
│ │ └── stg_events.sql # Cleaned staging model
│ ├── marts/
│ │ ├── fct_mod_events.sql
│ │ ├── mod_downloads.sql
│ │ ├── daily_active_users.sql
│ │ ├── mod_conversion.sql
│ │ ├── user_sessions.sql
│ │ └── session_metrics.sql
├── generate_data.py # Script to generate fake event data
├── dbt_project.yml
└── README.md

---

## Tools & Technologies

- **dbt + DuckDB:** Modern data transformation workflow
- **Python + Pandas:** Data generation and preparation
- **SQL (window functions, aggregation, sessionisation):** Core analytics
- **CI/CD friendly structure:** Seeds → Staging → Marts → Tests

Optional: You can connect to **Power BI, Tableau, or other BI tools** to visualise metrics.

---

## Data Pipeline

1. **Generate Raw Data:**  
   Simulated events for users, mods, and games are stored in `seeds/events.csv`.

2. **Staging Layer:**  
   - `stg_events` cleans and standardizes event names  
   - Ensures consistency for downstream models

3. **Fact Table:**  
   - `fct_mod_events` represents all user-mod interactions  
   - Forms the basis for aggregation

4. **Aggregations:**  
   - `mod_downloads`: Downloads per mod  
   - `daily_active_users`: Daily active users (DAU)  
   - `mod_conversion`: Conversion rate from views → downloads

5. **Sessionisation:**  
   - Groups user events into sessions using a **30-minute inactivity threshold**  
   - `user_sessions` outputs session start, end, and event counts  
   - `session_metrics` calculates total sessions per user and average events per session

---

## Data Quality & Testing

- All staging and marts tables include **dbt tests**:
  - `not_null` for IDs and session fields  
  - `accepted_values` for event names  
- Ensures **trustworthy, production-ready data**  

---

## Key Features & Highlights

- **Event-based analytics** – mimics tools like Mixpanel and Braze  
- **Sessionisation** – converts raw events into meaningful user sessions  
- **Business-oriented metrics** – DAU, downloads, conversion rates, session metrics  
- **Clean, testable dbt workflow** – ready for modern analytics engineering teams

---

## How to Run

1. Activate your Python environment:

```bash
# Windows
venv\Scripts\activate
# Mac/Linux
source venv/bin/activate

2. Install dependencies:
```bash
pip install -r requirements.txt

3. Install dependencies:
```bash
python generate_data.py

4. Install dependencies:
```bash
dbt seed

5. Install dependencies:
```bash
dbt run

6. Install dependencies:
```bash
dbt test