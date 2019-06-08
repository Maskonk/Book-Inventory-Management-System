DROP TABLE items;
DROP TABLE authors;

CREATE TABLE authors (
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE items (
    id SERIAL8 PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    quantity INT8,
    buying_cost FLOAT,
    selling_cost FLOAT,
    author_id INT8 REFERENCES authors(id)
);