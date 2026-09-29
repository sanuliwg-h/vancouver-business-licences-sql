# Vancouver Business Licences: A SQL Analysis (🚧 Work in progress)

**Question:** What do business licences in the City of Vancouver reveal about which types of businesses are growing, where they are located, and how long they last?

I use SQL to explore the City of Vancouver's public business licences data and answer four questions about business trends.

## Key findings
- Finding 1:
- Finding 2:
- Finding 3:

## Data
- **Source:** City of Vancouver Open Data Portal, "Business licences" dataset (https://opendata.vancouver.ca/explore/dataset/business-licences/)
- **Note from the City:** licence records use a unique identifier (Licence RSN), and business categories were consolidated from over 500 to under 100 in May 2024, so compare business types across that date carefully.
- **Cleaning:** describe what you fixed (missing dates, duplicate licences, inconsistent category names).

## Questions answered
1. Which business types have the most licences?
2. How has the number of licences issued changed year over year?
3. Which neighbourhoods have the most licensed businesses?
4. How many businesses renewed their licence in consecutive years?

All queries are in [`queries.sql`](queries.sql).

## How to run it
1. Download the dataset as a CSV from the portal link above.
2. Install [DB Browser for SQLite](https://sqlitebrowser.org/) (free).
3. Create a new database, then **File > Import > Table from CSV file** and name the table `licences`.
4. Open `queries.sql` and run each query in the **Execute SQL** tab.
5. **Check the column names** in your imported table. If they differ from the ones in `queries.sql`, rename them in the queries.

## Skills demonstrated
`SELECT`, `WHERE`, `GROUP BY`, `ORDER BY`, aggregate functions, `CASE`, date functions, subqueries, CTEs, window functions.

## What I'd do next
- Visualize the results in Power BI or Tableau
- Map licences by neighbourhood
