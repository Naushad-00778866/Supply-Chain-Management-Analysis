create database supplychain;
use supplychain;
DROP TABLE IF EXISTS supply_chain_data;

CREATE TABLE supply_chain_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    `Product type` VARCHAR(50),
    SKU VARCHAR(50),
    Price DECIMAL(10,2),
    Availability INT,
    `Number of products sold` INT,
    `Revenue generated` DECIMAL(12,2),
    `Customer demographics` VARCHAR(50),
    `Stock levels` INT,
    `Lead times` INT,
    `Order quantities` INT,
    `Shipping times` INT,
    `Shipping carriers` VARCHAR(50),
    `Shipping costs` DECIMAL(10,2),
    `Supplier name` VARCHAR(100),
    Location VARCHAR(50),
    `Lead time` INT,
    `Production volumes` INT,
    `Manufacturing lead time` INT,
    `Manufacturing costs` DECIMAL(10,2),
    `Inspection results` VARCHAR(20),
    `Defect rates` DECIMAL(6,3),
    `Transportation modes` VARCHAR(20),
    Routes VARCHAR(50),
    Costs DECIMAL(10,2)
);

select * from supply_chain_data;

-- Q1. Total Revenue by Product Type
SELECT `Product type`,
    ROUND(SUM(`Revenue generated`),2) AS total_revenue
FROM supply_chain_data
GROUP BY `Product type`
ORDER BY total_revenue DESC;

-- Q2. Products with Low Stock (Risk of Stock-out)
SELECT 
    SKU,
    `Product type`,
    `Stock levels`
FROM supply_chain_data
WHERE `Stock levels` < 50
ORDER BY `Stock levels`;

-- Q3. Average Shipping Time by Carrier
SELECT 
    `Shipping carriers`,
    ROUND(AVG(`Shipping times`),2) AS avg_shipping_time
FROM supply_chain_data
GROUP BY `Shipping carriers`
ORDER BY avg_shipping_time;

-- Q4. Average Defect Rate by Supplier
SELECT 
    `Supplier name`,
    ROUND(AVG(`Defect rates`),3) AS avg_defect_rate
FROM supply_chain_data
GROUP BY `Supplier name`
ORDER BY avg_defect_rate DESC;

-- Q5. Total Manufacturing Cost
SELECT 
    ROUND(SUM(`Manufacturing costs`),2) AS total_manufacturing_cost
FROM supply_chain_data;

-- Q6. Revenue by Location
SELECT 
    Location,
    ROUND(SUM(`Revenue generated`),2) AS total_revenue
FROM supply_chain_data
GROUP BY Location
ORDER BY total_revenue DESC;

-- Q7. Total Products Sold by Product Type
SELECT 
    `Product type`,
    SUM(`Number of products sold`) AS total_products_sold
FROM supply_chain_data
GROUP BY `Product type`
ORDER BY total_products_sold DESC;

-- Q8. Total Shipping Cost by Transportation Mode
SELECT 
    `Transportation modes`,
    ROUND(SUM(`Shipping costs`),2) AS total_shipping_cost
FROM supply_chain_data
GROUP BY `Transportation modes`
ORDER BY total_shipping_cost DESC;

-- Q9. Average Lead Time by Supplier
SELECT 
    `Supplier name`,
    ROUND(AVG(`Lead time`),2) AS avg_lead_time
FROM supply_chain_data
GROUP BY `Supplier name`
ORDER BY avg_lead_time desc;

-- Q10. Estimated Profit by Product Type
SELECT 
    `Product type`,
    ROUND(SUM(`Revenue generated` - `Manufacturing costs`),2) AS estimated_profit
FROM supply_chain_data
GROUP BY `Product type`
ORDER BY estimated_profit DESC;

-- Q11. What is the total available inventory across all products?
SELECT 
    SUM(Availability) AS total_availability
FROM supply_chain_data;

-- Q12. Compare production volume vs products sold by product type
SELECT 
    `Product type`,
    SUM(`Production volumes`) AS total_produced,
    SUM(`Number of products sold`) AS total_sold
FROM supply_chain_data
GROUP BY `Product type`
ORDER BY total_produced DESC;

-- Q13. Total shipping cost by carrier
SELECT 
    `Shipping carriers`,
    ROUND(SUM(`Shipping costs`),2) AS total_shipping_cost
FROM supply_chain_data
GROUP BY `Shipping carriers`
ORDER BY total_shipping_cost DESC;

-- Q14. Average manufacturing lead time by product type
SELECT 
    `Product type`,
    ROUND(AVG(`Manufacturing lead time`),2) AS avg_mfg_lead_time
FROM supply_chain_data
GROUP BY `Product type`
ORDER BY avg_mfg_lead_time DESC;


-- Q15. Distribution of inspection results
SELECT 
    `Inspection results`,
    COUNT(*) AS total_records
FROM supply_chain_data
GROUP BY `Inspection results`
ORDER BY total_records DESC;

-- Q16. What is the overall profit margin percentage?
SELECT 
    ROUND(
        (SUM(`Revenue generated`) - SUM(`Manufacturing costs`)) 
        / SUM(`Revenue generated`) * 100,
    2) AS profit_margin_percent
FROM supply_chain_data;

-- Q17. Profit margin percentage by product type
SELECT 
    `Product type`,
    ROUND(
        (SUM(`Revenue generated`) - SUM(`Manufacturing costs`))
        / SUM(`Revenue generated`) * 100,
    2) AS profit_margin_percent
FROM supply_chain_data
GROUP BY `Product type`
ORDER BY profit_margin_percent DESC;

-- Q18. Profit margin percentage by supplier
SELECT 
    `Supplier name`,
    ROUND(
        (SUM(`Revenue generated`) - SUM(`Manufacturing costs`))
        / SUM(`Revenue generated`) * 100,
    2) AS profit_margin_percent
FROM supply_chain_data
GROUP BY `Supplier name`
ORDER BY profit_margin_percent DESC;


-- Q19. Profit margin percentage by location
SELECT 
    Location,
    ROUND(
        (SUM(`Revenue generated`) - SUM(`Manufacturing costs`))
        / SUM(`Revenue generated`) * 100,
    2) AS profit_margin_percent
FROM supply_chain_data
GROUP BY Location
ORDER BY profit_margin_percent DESC;

-- Q20. What is the total profit amount?
SELECT 
    ROUND(
        SUM(`Revenue generated`) - SUM(`Manufacturing costs`),
    2) AS total_profit
FROM supply_chain_data;



-- Q21 Total manufacturing cost
SELECT 
    ROUND(SUM(`Manufacturing costs`), 2) AS total_manufacturing_cost
FROM supply_chain_data;

-- 22 Total profit amount
SELECT 
    ROUND(
        SUM(`Revenue generated`) - SUM(`Manufacturing costs`),
    2) AS total_profit
FROM supply_chain_data;