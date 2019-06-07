DROP TABLE items;
DROP TABLE manufacturers;

CREATE TABLE manufacturers (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE items (
    id SERIAL8 PRIMARY KEY,
    name VARCHAR(255),
    quantity INT8,
    buying_cost FLOAT,
    selling_cost FLOAT,
    manufacturer_id INT8 REFERENCES manufacturers(id)
);