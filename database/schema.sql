CREATE TABLE item (
  id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL DEFAULT FALSE,
  author_id INTEGER NOT NULL,
  source_id INTEGER NOT NULL,
  label_id INTEGER NOT NULL,
  genre_id INTEGER NOT NULL,
  FOREIGN KEY (author_id) REFERENCES author (id),
  FOREIGN KEY (source_id) REFERENCES source (id),
  FOREIGN KEY (label_id) REFERENCES label (id),
  FOREIGN KEY (genre_id) REFERENCES genre (id)
);

CREATE TABLE games(
  id INT GENERATED ALWAYS AS IDENTITY,
  multiplayer BOOLEAN,
  last_played_at DATE,
  FOREIGN KEY(id) REFERENCES item(id)
);

CREATE TABLE author(
  id INT GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  PRIMARY KEY(id)
);

CREATE TABLE book (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  publish_date DATE,
  archived BOOLEAN,
  publisher VARCHAR(100),
  cover_state VARCHAR(50),
  label_id INTEGER REFERENCES label (id)
);

CREATE TABLE label (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  title VARCHAR(100),
  color VARCHAR(100)
);

CREATE TABLE music_albums (
  id INT GENERATED ALWAYS AS IDENTITY,
  publish_date DATE,
  archived BOOLEAN,
  on_spotify BOOLEAN,
  genre_id INT,
  ADD CONSTRAINT fk_genre_id FOREIGN KEY (genre_id) REFERENCES genres (id);
  PRIMARY KEY(id)
);

CREATE TABLE genres (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(250),
  PRIMARY KEY(id)
);