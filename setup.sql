-- 🍺 Data Oktoberfest — Blitz-SQL (DuckDB)
-- Run in https://shell.duckdb.org
-- Replace BASE_URL with the raw GitHub folder, e.g.
-- https://raw.githubusercontent.com/<org>/<repo>/main/blitz_sql_data

CREATE OR REPLACE TABLE tents (tent_id INTEGER, tent_name VARCHAR, brewery VARCHAR, capacity INTEGER);
CREATE OR REPLACE TABLE beers (beer_id INTEGER, beer_name VARCHAR, style VARCHAR, abv DECIMAL(3,1));
CREATE OR REPLACE TABLE guests (guest_id INTEGER, guest_name VARCHAR, country VARCHAR);
CREATE OR REPLACE TABLE tent_visits (visit_id INTEGER, guest_id INTEGER, tent_id INTEGER, entered_at TIMESTAMP, exited_at TIMESTAMP);
CREATE OR REPLACE TABLE orders (order_id INTEGER, guest_id INTEGER, tent_id INTEGER, beer_id INTEGER, ordered_at TIMESTAMP, mass_count INTEGER);
CREATE OR REPLACE TABLE beer_prices (beer_id INTEGER, price_eur DECIMAL(6,2), valid_from TIMESTAMP, valid_to TIMESTAMP);
CREATE OR REPLACE TABLE keg_cdc (event_id INTEGER, keg_id INTEGER, tent_id INTEGER, beer_id INTEGER, capacity_l INTEGER, liters_left INTEGER, op VARCHAR, updated_at TIMESTAMP, ingested_at TIMESTAMP);

INSERT INTO tents SELECT * FROM read_csv('BASE_URL/tents.csv', header = true);
INSERT INTO beers SELECT * FROM read_csv('BASE_URL/beers.csv', header = true);
INSERT INTO guests SELECT * FROM read_csv('BASE_URL/guests.csv', header = true);
INSERT INTO tent_visits SELECT * FROM read_csv('BASE_URL/tent_visits.csv', header = true);
INSERT INTO orders SELECT * FROM read_csv('BASE_URL/orders.csv', header = true);
INSERT INTO beer_prices SELECT * FROM read_csv('BASE_URL/beer_prices.csv', header = true);
INSERT INTO keg_cdc SELECT * FROM read_csv('BASE_URL/keg_cdc.csv', header = true);
