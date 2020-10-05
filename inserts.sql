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
INSERT INTO subscriptions(given, expires)
VALUES ('2020-3-15', '2020-12-15');
INSERT INTO subscriptions(given, expires)
VALUES ('2020-3-15', '2020-11-15');
INSERT INTO subscriptions(given, expires)
VALUES ('2020-3-15', '2020-10-15');

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
INSERT INTO authors(id, full_name)
VALUES ('rowling', 'joanne rowling');
INSERT INTO authors(id, full_name)
VALUES ('lermontov', 'michael lermontov');
INSERT INTO authors(id, full_name)
VALUES ('pushkin', 'alexander pushkin');
INSERT INTO authors(id, full_name)
VALUES ('tolstoy', 'lev tolstoy');
INSERT INTO authors(id, full_name)
VALUES ('aligeri', 'dante alig`eri');
INSERT INTO authors(id, full_name)
VALUES ('bulgakov', 'michael bulgakov');
INSERT INTO authors(id, full_name)
VALUES ('turgenev', 'ivan turgenev');
INSERT INTO authors(id, full_name)
VALUES ('shakespeare', 'william shakespeare');
INSERT INTO authors(id, full_name)
VALUES ('balsak', 'onore de balsak');
INSERT INTO authors(id, full_name)
VALUES ('stendal', 'stendal');
INSERT INTO authors(id, full_name)
VALUES ('gofman', 'ernst gofman');
INSERT INTO authors(id, full_name)
VALUES ('cooper', 'james fenimore cooper');
INSERT INTO authors(id, full_name)
VALUES ('ostin', 'jane ostin');
INSERT INTO authors(id, full_name)
VALUES ('nabokov', 'vladimir nabokov');
INSERT INTO authors(id, full_name)
VALUES ('swift', 'jonathan swift');
INSERT INTO authors(id, full_name)
VALUES ('orwell', 'george orwell');
INSERT INTO authors(id, full_name)
VALUES ('bradbury', 'ray bradbury');
INSERT INTO authors(id, full_name)
VALUES ('fitzgerald', 'francis scott fitzgerald');

# Edition inserts
INSERT INTO editions(title, date)
VALUES ('Edition 1', '2020-1-1');
INSERT INTO editions(title, date)
VALUES ('Edition 2', '2020-2-1');
INSERT INTO editions(title, date)
VALUES ('Edition 3', '2020-3-1');

# Books inserts
INSERT INTO books(title, book_src, price, fine, author_id, edition_id)
VALUES ('Harry Potter and the Philosopher\'s stone', 'harry_potter_and_the_philosopher''s_stone.webp', 10, 5, 'rowling',
        1);
INSERT INTO books(title, book_src, price, fine, author_id, edition_id)
VALUES ('Harry Potter and the Chamber of Secrets', 'harry_potter_and_the_chamber_of_secrets.jpg', 10, 5, 'rowling', 1);
INSERT INTO books(title, book_src, price, fine, author_id, edition_id)
VALUES ('Harry Potter and the Prisoner of Azkaban', 'harry_potter_and_the_prisoner_of_azkaban.jpg', 10, 5, 'rowling',
        1);
INSERT INTO books(title, book_src, price, fine, author_id, edition_id)
VALUES ('Harry Potter and the Goblet of Fire', 'harry_potter_and_the_goblet_of_fire.webp', 10, 5, 'rowling', 1);
INSERT INTO books(title, book_src, price, fine, author_id, edition_id)
VALUES ('Harry Potter and the Order of Phoenix', 'harry_potter_and_the_order_of_phoenix.jpg', 10, 5, 'rowling', 1);
INSERT INTO books(title, book_src, price, fine, author_id, edition_id)
VALUES ('Harry Potter and the Half-blood prince', 'harry_potter_and_the_half-blood_prince.webp', 10, 5, 'rowling', 1);
INSERT INTO books(title, book_src, price, fine, author_id, edition_id)
VALUES ('Harry Potter and the Deathly Hallows', 'harry_potter_and_the_deathly_hallows.webp', 10, 5, 'rowling', 1);
INSERT INTO books(title, book_src, price, fine, author_id, edition_id)
VALUES ('Fahrenheit 451', 'fahrenheit-451.jpg', 10, 5, 'bradbury', 1);
INSERT INTO books(title, book_src, price, fine, author_id, edition_id)
VALUES ('1984', '1984.png', 10, 5, 'orwell', 1);
INSERT INTO books(title, book_src, price, fine, author_id, edition_id)
VALUES ('Anna Karenina', 'anna_karenina.webp', 10, 5, 'tolstoy', 1);
INSERT INTO books(title, book_src, price, fine, author_id, edition_id)
VALUES ('Crime and punishment', 'crime_and_punishment.webp', 10, 5, 'dostoevskyi', 1);
INSERT INTO books(title, book_src, price, fine, author_id, edition_id)
VALUES ('Divine comedy', 'divine_comedy.jpg', 10, 5, 'aligeri', 1);
INSERT INTO books(title, book_src, price, fine, author_id, edition_id)
VALUES ('Dog''s heart', 'dog''s_heart.jpg', 10, 5, 'bulgakov', 1);
INSERT INTO books(title, book_src, price, fine, author_id, edition_id)
VALUES ('Evgeniy Onegin', 'evgeniy_onegin.jpg', 10, 5, 'pushkin', 1);
INSERT INTO books(title, book_src, price, fine, author_id, edition_id)
VALUES ('Fathers and children', 'fathers_and_children.jpg', 10, 5, 'turgenev', 1);
INSERT INTO books(title, book_src, price, fine, author_id, edition_id)
VALUES ('Gamlet', 'gamlet.jpeg', 10, 5, 'shakespeare', 1);
INSERT INTO books(title, book_src, price, fine, author_id, edition_id)
VALUES ('Gobsek', 'gobsek.webp', 10, 5, 'balsak', 1);
INSERT INTO books(title, book_src, price, fine, author_id, edition_id)
VALUES ('Great Gatsby', 'great_gatsby.jpg', 10, 5, 'fitzgerald', 1);
INSERT INTO books(title, book_src, price, fine, author_id, edition_id)
VALUES ('Gulliver''s travels', 'gulliver''s_travels.jpg', 10, 5, 'swift', 1);
INSERT INTO books(title, book_src, price, fine, author_id, edition_id)
VALUES ('Hero of our time', 'hero_of_our_time.jpg', 10, 5, 'lermontov', 1);
INSERT INTO books(title, book_src, price, fine, author_id, edition_id)
VALUES ('lolita', 'lolita.webp', 10, 5, 'nabokov', 1);
INSERT INTO books(title, book_src, price, fine, author_id, edition_id)
VALUES ('Master and Margaryta', 'master_and_margaryta.jpg', 10, 5, 'bulgakov', 1);
INSERT INTO books(title, book_src, price, fine, author_id, edition_id)
VALUES ('Pride and prejudice', 'pride_and_prejudice.jpg', 10, 5, 'ostin', 1);
INSERT INTO books(title, book_src, price, fine, author_id, edition_id)
VALUES ('Red and black', 'red_and_black.jpg', 10, 5, 'stendal', 1);
INSERT INTO books(title, book_src, price, fine, author_id, edition_id)
VALUES ('Romeo and juliet', 'romeo_i_juliet.jpg', 10, 5, 'shakespeare', 1);
INSERT INTO books(title, book_src, price, fine, author_id, edition_id)
VALUES ('The last of the mohicans', 'the_last_of_the_mohicans.jpeg', 10, 5, 'cooper', 1);
INSERT INTO books(title, book_src, price, fine, author_id, edition_id)
VALUES ('The nutcracker and the mouse king', 'the_nutcracker_and_the_mouse_king.jpg', 10, 5, 'gofman', 1);
INSERT INTO books(title, book_src, price, fine, author_id, edition_id)
VALUES ('War and peace', 'war_and_peace.jpg', 10, 5, 'tolstoy', 1);

# Catalog inserts
INSERT INTO catalog(book_id, book_amount)
VALUES (1, 5);
INSERT INTO catalog(book_id, book_amount)
VALUES (2, 8);

# OrderTypes inserts
INSERT INTO orderTypes(type)
VALUES ('home');
INSERT INTO orderTypes(type)
VALUES ('reading hall');

# OrderStatuses inserts
INSERT INTO orderStatuses(status)
VALUES ('new');
INSERT INTO orderStatuses(status)
VALUES ('awaiting for user');
INSERT INTO orderStatuses(status)
VALUES ('awaiting return');
INSERT INTO orderStatuses(status)
VALUES ('done');

# Orders inserts
INSERT INTO orders(user_id, book_id, book_amount, order_status_id, order_type_id)
VALUES (1, 1, 2, 1, 1);
INSERT INTO orders(user_id, book_id, book_amount, order_status_id, order_type_id)
VALUES (3, 2, 3, 3, 1);
