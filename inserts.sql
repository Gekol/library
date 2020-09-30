# UserTypes inserts
INSERT INTO userTypes(type)
VALUES ('user');
INSERT INTO userTypes(type)
VALUES ('librarian');
INSERT INTO userTypes(type)
VALUES ('admin');

# UserStatuses inserts
INSERT INTO userStatuses(status)
VALUES ('active');
INSERT INTO userStatuses(status)
VALUES ('blocked');

# Subscriptions inserts
INSERT INTO subscriptions(given, expires) VALUES ('2020-3-15', '2020-12-15');
INSERT INTO subscriptions(given, expires) VALUES ('2020-3-15', '2020-11-15');
INSERT INTO subscriptions(given, expires) VALUES ('2020-3-15', '2020-10-15');

# Users inserts
INSERT INTO users(first_name, last_name, email, user_password, user_type_id, user_status_id, subscription_id)
VALUES ('Darth', 'Vader', 'vader@example.com', '1111', 3, 1, 1);
INSERT INTO users(first_name, last_name, email, user_password, user_type_id, user_status_id, subscription_id)
VALUES ('Luke', 'Skywalker', 'lskywalker@example.com', '1111', 2, 1, 1);
INSERT INTO users(first_name, last_name, email, user_password, user_type_id, user_status_id, subscription_id)
VALUES ('Mace', 'Vindu', 'vindu@example.com', '1111', 1, 1, 1);
INSERT INTO users(first_name, last_name, email, user_password, user_type_id, user_status_id, subscription_id)
VALUES ('Obi-Wan', 'Kenobi', 'kenobi@example.com', '1111', 1, 1, 1);

# Author inserts
INSERT INTO authors(full_name)
VALUES ('Joanne Rowling');
INSERT INTO authors(full_name)
VALUES ('Ayn Rand');
INSERT INTO authors(full_name)
VALUES ('Robert Greene');

# Edition inserts
INSERT INTO editions(title, date) VALUES ('Edition 1', '2020-1-1');
INSERT INTO editions(title, date) VALUES ('Edition 2', '2020-2-1');
INSERT INTO editions(title, date) VALUES ('Edition 3', '2020-3-1');

# Books inserts
INSERT INTO books(title, author_id, edition_id) VALUES ('Harry Potter and the philosopher\'s stone', 1, 1);
INSERT INTO books(title, author_id, edition_id) VALUES ('Harry Potter and the chamber of secrets', 1, 1);
INSERT INTO books(title, author_id, edition_id) VALUES ('Atlas Shrugged', 2, 1);
INSERT INTO books(title, author_id, edition_id) VALUES ('33 strategies of War', 3, 1);

# Catalog inserts
INSERT INTO catalog(book_id, book_amount) VALUES (1, 5);
INSERT INTO catalog(book_id, book_amount) VALUES (2, 8);
INSERT INTO catalog(book_id, book_amount) VALUES (3, 10);
INSERT INTO catalog(book_id, book_amount) VALUES (4, 9);

# OrderTypes inserts
INSERT INTO orderTypes(type)
VALUES ('home');
INSERT INTO orderTypes(type)
VALUES ('reading hall');

# OrderStatuses inserts
INSERT INTO orderStatuses(status) VALUES ('new');
INSERT INTO orderStatuses(status) VALUES ('awaiting for user');
INSERT INTO orderStatuses(status) VALUES ('awaiting return');
INSERT INTO orderStatuses(status) VALUES ('done');

# Orders inserts
INSERT INTO orders(user_id, book_id, book_amount, order_status_id, order_type_id) VALUES (1, 1, 2, 1, 1);
INSERT INTO orders(user_id, book_id, book_amount, order_status_id, order_type_id) VALUES (3, 4, 3, 3, 1);

# BooksOrders inserts
# INSERT INTO books_orders(book_id, order_id) VALUES (2, 1);
# INSERT INTO books_orders(book_id, order_id) VALUES (3, 1);
# INSERT INTO books_orders(book_id, order_id) VALUES (4, 2);
