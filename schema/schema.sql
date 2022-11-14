CREATE TABLE book (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    publish_date DATE,
    archived BOOLEAN,
    publisher VARCHAR(100),
    cover_state VARCHAR(50),
    label_id INTEGER REFERENCES label (id)
);