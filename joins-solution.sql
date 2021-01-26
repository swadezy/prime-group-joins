--Tasks

--Get all customers and their addresses.
SELECT * FROM "customers"
JOIN "addresses" ON "customers".id = "addresses".customer_id;

--Get all orders and their line items (orders, quantity and product).
SELECT "orders".id, "line_items".quantity, "products".description FROM "orders"
LEFT JOIN "line_items" ON "orders".id = "line_items".order_id
LEFT JOIN "products" ON "line_items".product_id = "products".id;

--Which warehouses have cheetos?
SELECT "warehouse".warehouse, "products".description, "warehouse_product".on_hand FROM "warehouse"
JOIN "warehouse_product" ON "warehouse".id = "warehouse_product".warehouse_id
JOIN "products" ON "warehouse_product".product_id = "products".id
WHERE "products".description LIKE 'cheetos';

SELECT "warehouse".warehouse, "products".description "warehouse_product".on_hand FROM "products"
JOIN "warehouse_product" ON "products".id = "warehouse_product".product_id
JOIN "warehouse" ON "warehouse_product".warehouse_id = "warehouse".id
WHERE "products".description LIKE 'cheetos';

--Which warehouses have diet pepsi?
SELECT "warehouse".warehouse FROM "warehouse"
JOIN "warehouse_product" ON "warehouse".id = "warehouse_product".warehouse_id
JOIN "products" ON "warehouse_product".product_id = "products".id
WHERE "products".description LIKE 'diet pepsi';

--Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "customers".id, COUNT("orders".id) FROM "orders"
JOIN "addresses" ON "orders".address_id = "addresses".id
JOIN "customers" ON "addresses".customer_id = "customers".id
GROUP BY "customers".id;

--How many customers do we have?
SELECT COUNT("customers".id) FROM "customers";

--How many products do we carry?
SELECT COUNT("products".id) FROM "products";

--What is the total available on-hand quantity of diet pepsi?
SELECT SUM("warehouse_product".on_hand) FROM "products"
JOIN "warehouse_product" ON "products".id = "warehouse_product".product_id
WHERE "products".description LIKE 'diet pepsi';
