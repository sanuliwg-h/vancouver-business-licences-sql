-- Vancouver Business Licences: SQL Analysis
-- Database: SQLite | Table: licences
-- IMPORTANT: column names below are my best guesses. After importing the CSV, check
-- the actual headers (PRAGMA table_info(licences);) and rename anything that differs.
-- Columns used: LicenceRSN, BusinessType, IssuedDate, LocalArea

-- 0. Explore first: look at the table before analyzing it
SELECT * FROM licences LIMIT 10;
SELECT COUNT(*) AS total_rows FROM licences;

-- 1. Which business types have the most licences?
SELECT
    BusinessType,
    COUNT(*) AS num_licences
FROM licences
GROUP BY BusinessType
ORDER BY num_licences DESC
LIMIT 10;

-- 2. How has the number of licences issued changed year over year?
--    (year-over-year change shown with a window function)
WITH yearly AS (
    SELECT
        strftime('%Y', IssuedDate) AS year,
        COUNT(*) AS num_licences
    FROM licences
    WHERE IssuedDate IS NOT NULL
    GROUP BY year
)
SELECT
    year,
    num_licences,
    num_licences - LAG(num_licences) OVER (ORDER BY year) AS change_from_prev_year,
    ROUND(100.0 * (num_licences - LAG(num_licences) OVER (ORDER BY year))
          / LAG(num_licences) OVER (ORDER BY year), 1) AS pct_change
FROM yearly
ORDER BY year;

-- 3. Which neighbourhoods have the most licensed businesses?
SELECT
    LocalArea,
    COUNT(DISTINCT LicenceRSN) AS num_licences
FROM licences
WHERE LocalArea IS NOT NULL
GROUP BY LocalArea
ORDER BY num_licences DESC;

-- 4. How many businesses renewed in consecutive years?
--    (a business = a repeated name + address; adjust the identifier to fit your data)
WITH business_years AS (
    SELECT DISTINCT
        BusinessName,
        strftime('%Y', IssuedDate) AS year
    FROM licences
    WHERE BusinessName IS NOT NULL AND IssuedDate IS NOT NULL
)
SELECT
    a.year AS year,
    COUNT(*) AS renewed_next_year
FROM business_years a
JOIN business_years b
  ON a.BusinessName = b.BusinessName
 AND CAST(b.year AS INTEGER) = CAST(a.year AS INTEGER) + 1
GROUP BY a.year
ORDER BY a.year;
