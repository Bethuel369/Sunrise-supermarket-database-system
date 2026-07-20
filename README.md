# Sunrise Supermarket Database Project

## Overview

A PostgreSQL relational database designed for Sunrise Supermarket to manage customers, product inventory, and order processing efficiently.

## Schema Setup

The database operates within the `sunrise` schema and contains four core tables:

* **`customers`**: Stores customer IDs, names, emails, phone numbers, locations, and loyalty points.
* **`products`**: Maintains product catalogs, categories, unit prices, and stock quantities.
* **`orders`**: Tracks transactional details including order dates, customer links, and status.
* **`order_items`**: Links specific products and quantities to individual parent orders.

---

## Part 1: Schema Modifications

* Renamed the product stock column to `stock_quantity` for clarity.
* Added a `loyalty_points` column defaulted to `0` for the customers table.
* Expanded the `product_name` column data type length to 150 characters.

---

## Part 2: Data Manipulation

* Inserted initial sample records into the customers, products, orders, and order items tables.
* Updated the fulfillment status of order ID 4 to `Delivered`.
* Cleaned up database records by removing cancelled orders and their associated line items.

---

## Part 3: Data Retrieval & Filtering

* Filtered product catalogs by specific price thresholds and pattern matching (e.g., searching for items containing "Oil").
* Segmented customers based on geographical locations such as Nairobi, Nakuru, and Mombasa.
* Analyzed order frequency using `COUNT`, `GROUP BY`, and `HAVING` clauses to isolate repeat buyers.

---

## Part 5: Joins & Reporting

* Connected customers and orders using `INNER JOIN` operations.
* Merged order tables with inventory line items to view complete purchase details.
* Executed comprehensive multi-table joins to link customer names, order IDs, product names, and quantities.
* Calculated total product quantities sold using `SUM` aggregation grouped by product name for inventory reporting.
