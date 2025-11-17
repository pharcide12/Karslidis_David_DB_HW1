CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(10),
    DOB DATE,
    job_title VARCHAR(100),
    job_industry_category VARCHAR(100),
    wealth_segment VARCHAR(50),
    deceased_indicator CHAR(1),
    owns_car CHAR(1),
    address VARCHAR(255),
    postcode VARCHAR(10),
    state VARCHAR(50),
    country VARCHAR(50),
    property_valuation INT
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    brand VARCHAR(50),
    product_line VARCHAR(50),
    product_class VARCHAR(50),
    product_size VARCHAR(50),
    list_price NUMERIC(10,2),
    standard_cost NUMERIC(10,2)
);

CREATE TABLE transactions (
    transaction_id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products(product_id),
    customer_id INT REFERENCES customers(customer_id),
    transaction_date DATE,
    online_order BOOLEAN,
    order_status VARCHAR(20)
);

INSERT INTO customers (first_name, last_name, gender, dob, job_title, job_industry_category, wealth_segment, deceased_indicator, owns_car, address, postcode, state, country, property_valuation)
VALUES
('John', 'Smith', 'Male', '1985-04-12', 'Engineer', 'Manufacturing', 'Mass Customer', 'N', 'Y', '123 Main St', '2000', 'NSW', 'Australia', 8),
('Emily', 'Brown', 'Female', '1990-07-25', 'Teacher', 'Education', 'High Net Worth', 'N', 'N', '45 Queen St', '3000', 'VIC', 'Australia', 9);


INSERT INTO products (brand, product_line, product_class, product_size, list_price, standard_cost)
VALUES
('Solex', 'Standard', 'Medium', 'Medium', 71.49, 53.62),
('WeareA2B', 'Road', 'High', 'Large', 209.59, 175.00);

INSERT INTO transactions (product_id, customer_id, transaction_date, online_order, order_status)
VALUES
(1, 1, '2017-02-25', FALSE, 'Approved'),
(2, 2, '2017-03-15', TRUE, 'Approved');