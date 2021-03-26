SELECT
    SYSDATE() as timestamp,
    'start user_v.sql' as decsription;

INSERT INTO
    user
VALUES
(
        1,
        'admin',
        '$2a$10$EaSz1dMbx8LdpbELi1rLgukN1wnAWT9UsK1Y5f3FNUKaMgASeYKWe',
        'admin',
        'the Boss',
        'admin@sirius-store.com',
        'male',
        '10.0.1.1',
        '2010-04-22 23:51:16',
        '2020-01-07 00:28:38',
        0,
        'https://i.imgur.com/htQjj8d.png',
        'Admin',
        true
    ),
(
        2,
        'admin1',
        '$2a$10$l8LXbDXg/7s1ZdW/Z0P25uiltCyKDt7JNDFWFMbA8FsxGIjko.Ik6',
        'Tom',
        'Hanks',
        'admin1@email.com',
        'male',
        '10.0.0.12',
        '2021-03-07 16:13:50',
        NULL,
        0,
        'https://imgur.com/9kY8XfA.png',
        'Admin',
        true
    ),
(
        3,
        'admin2',
        '$2a$10$1AB/oLKKvMaetmTM6VMzFOx6v3urNB2Mxkgw05zQHvH98I9qoTN3W',
        'Clint',
        'Eastwood',
        'admin2@email.com',
        'male',
        '10.0.0.12',
        '2021-03-07 16:16:30',
        NULL,
        0,
        'https://imgur.com/NBD2oCo.png',
        'Almost admin',
        true
    ),
(
        4,
        'admin3',
        '$2a$10$taWQVEi8ecIg/DSmbzMyEOMxyfLS7YfsBzyy6E9Pd349pu.IMhU42',
        'Scarlett',
        'Johansson',
        'admin3@email.com',
        'female',
        '10.0.0.12',
        '2021-03-07 16:16:35',
        NULL,
        0,
        'https://imgur.com/2DjaLVK.png',
        'User',
        true
    ),
(
        5,
        'user1',
        '$2a$10$0NQa9CW9FtfGqugflWFkyOjAn53aus44068kimLiDluarSWmBW2ZK',
        'Jesse',
        'Jane',
        'user1@email.com',
        'female',
        '10.0.0.12',
        '2021-03-07 16:16:42',
        NULL,
        0,
        'https://imgur.com/3quUaEo.png',
        'User',
        true
    ),
(
        6,
        'user2',
        '$2a$10$qQdjflJZ4LOJen6CZqBMA.0QyNQ6DKegLgqN5VKSIu7KhIX4E3q1m',
        'Chris',
        'Hemsworth',
        'user2@email.com',
        'male',
        '10.0.0.12',
        '2021-03-07 16:16:46',
        NULL,
        0,
        'https://imgur.com/jTpS64U.png',
        'User',
        true
    ),
(
        7,
        'user3',
        '$2a$10$vTZJsUsMDPw63rb8wt.Lcek07.BgCDXZhmO3Kgow5wHuvQ8P6e7ky',
        'Robert',
        'Downey jr',
        'user3@email.com',
        'male',
        '10.0.0.12',
        '2021-03-07 16:16:51',
        NULL,
        0,
        'https://imgur.com/J25jDgF.png',
        'User',
        false
    );