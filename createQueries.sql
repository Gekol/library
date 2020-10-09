CREATE TABLE IF NOT EXISTS authors
(
    id           VARCHAR(100) PRIMARY KEY,
    full_name_en VARCHAR(50),
    full_name_ru VARCHAR(50)
);
CREATE TABLE IF NOT EXISTS userTypes
(
    id      INTEGER PRIMARY KEY AUTO_INCREMENT,
    type_en VARCHAR(50),
    type_ru VARCHAR(50)
);
CREATE TABLE IF NOT EXISTS userStatuses
(
    id        INTEGER PRIMARY KEY AUTO_INCREMENT,
    status_en VARCHAR(50),
    status_ru VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS subscriptions
(
    id      INTEGER PRIMARY KEY AUTO_INCREMENT,
    given   DATE,
    expires DATE
);
CREATE TABLE IF NOT EXISTS orderTypes
(
    id      INTEGER PRIMARY KEY AUTO_INCREMENT,
    type_en VARCHAR(50),
    type_ru VARCHAR(50)
);
CREATE TABLE IF NOT EXISTS orderStatuses
(
    id        INTEGER PRIMARY KEY AUTO_INCREMENT,
    status_en VARCHAR(50),
    status_ru VARCHAR(50)
);
CREATE TABLE IF NOT EXISTS users
(
    id              INTEGER PRIMARY KEY AUTO_INCREMENT,
    first_name      VARCHAR(50),
    last_name       VARCHAR(50),
    email           VARCHAR(100) NOT NULL UNIQUE,
    user_password   VARCHAR(100) NOT NULL,
    user_type_id    INTEGER REFERENCES userTypes (id) ON DELETE CASCADE,
    user_status_id  INTEGER REFERENCES userStatuses (id) ON DELETE CASCADE,
    subscription_id INTEGER REFERENCES subscriptions (id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS books
(
    id         INTEGER PRIMARY KEY AUTO_INCREMENT,
    title_en   VARCHAR(100),
    title_ru   VARCHAR(100),
    book_src   VARCHAR(100),
    price      INTEGER,
    fine       INTEGER,
    author_id  VARCHAR(100) REFERENCES authors (id) ON DELETE CASCADE,
    edition_id INTEGER references editions (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS editions
(
    id       INTEGER PRIMARY KEY AUTO_INCREMENT,
    title_en VARCHAR(50),
    title_ru VARCHAR(50),
    date     DATE
);

CREATE TABLE IF NOT EXISTS catalog
(
    book_id     INTEGER references books (id),
    book_amount INTEGER
);

CREATE TABLE IF NOT EXISTS orders
(
    id              INTEGER PRIMARY KEY AUTO_INCREMENT,
    user_id         INTEGER REFERENCES users (id) ON DELETE CASCADE,
    book_id         INTEGER REFERENCES books (id) ON DELETE CASCADE,
    fine            INTEGER,
    deadline        DATE NULL,
    order_status_id integer references orderStatuses (id) ON DELETE CASCADE,
    order_type_id   integer references orderTypes (id) ON DELETE CASCADE
);
