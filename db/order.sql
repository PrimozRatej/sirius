create table orders (
	id INT PRIMARY KEY,
	user_id INT,
	address_id INT,
	discount_id INT,
	created DATE,
	modified DATE,
	status VARCHAR(3),
	amount VARCHAR(50),
	currency VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (address_id) REFERENCES address(id),
    FOREIGN KEY (discount_id) REFERENCES discount(id)
);
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (1, 68, 75, 99, '2019-07-15 16:04:25', '2019-12-09 12:27:14', 'AFM', '311.41', 'PHP');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (2, 30, 37, 98, '2019-08-18 00:11:38', '2020-02-14 09:36:24', 'APP', '228.82', 'EUR');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (3, 22, 27, 22, '2019-06-19 14:29:07', '2019-05-14 14:12:09', 'APP', '139.05', 'RSD');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (4, 33, 7, 74, '2019-04-30 16:08:07', '2019-05-31 10:02:28', 'SPD', '32.56', 'SEK');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (5, 93, 63, 43, '2020-02-14 02:07:58', '2019-10-17 20:18:41', 'PDG', '80.24', 'CNY');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (6, 18, 32, 21, '2019-04-22 21:15:00', '2019-07-25 10:15:01', 'CMD', '257.26', 'CNY');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (7, 49, 33, 99, '2019-07-16 00:08:11', '2019-10-24 21:41:16', 'SPD', '88.84', 'USD');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (8, 52, 45, 50, '2019-10-17 20:34:20', '2020-01-22 13:18:01', 'AFM', '185.67', 'ILS');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (9, 97, 8, 82, '2020-01-15 11:02:25', '2020-03-05 01:56:00', 'SPD', '269.71', 'CRC');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (10, 53, 4, 9, '2019-10-26 13:57:04', '2019-05-02 12:05:49', 'PDG', '68.68', 'IDR');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (11, 66, 28, 71, '2020-02-02 18:56:06', '2019-12-19 04:51:22', 'CCD', '240.51', 'HRK');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (12, 32, 92, 26, '2019-11-30 06:04:41', '2020-02-15 22:48:49', 'DCD', '157.11', 'PHP');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (13, 66, 72, 4, '2019-12-08 05:16:32', '2019-06-13 15:30:36', 'PDG', '113.16', 'IDR');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (14, 63, 3, 84, '2019-06-29 23:04:51', '2019-09-23 04:21:06', 'CCD', '160.04', 'EUR');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (15, 74, 95, 47, '2019-07-13 06:28:17', '2020-02-22 20:11:10', 'PDG', '193.31', 'KRW');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (16, 84, 21, 88, '2019-09-10 08:33:50', '2020-01-01 11:47:33', 'AFM', '266.87', 'USD');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (17, 21, 37, 51, '2019-09-24 23:50:08', '2019-10-10 05:26:29', 'CMD', '259.80', 'CNY');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (18, 52, 45, 84, '2019-07-28 20:12:07', '2020-01-23 11:03:26', 'SPD', '243.47', 'USD');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (19, 83, 10, 57, '2019-12-23 12:25:22', '2019-06-28 21:56:50', 'ASM', '111.03', 'RUB');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (20, 50, 57, 57, '2019-05-20 02:02:27', '2020-02-09 08:22:21', 'CCD', '192.73', 'EUR');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (21, 32, 73, 49, '2020-02-29 18:54:02', '2019-11-02 15:28:07', 'PDG', '296.80', 'IDR');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (22, 62, 58, 37, '2019-12-15 11:37:37', '2019-08-05 17:51:34', 'ASM', '219.63', 'EUR');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (23, 39, 31, 16, '2019-06-28 17:19:37', '2019-04-26 23:17:36', 'PSP', '132.73', 'IDR');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (24, 6, 39, 25, '2019-10-02 22:56:03', '2019-06-12 06:14:59', 'PDG', '267.63', 'CNY');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (25, 6, 88, 47, '2019-05-07 21:56:11', '2019-12-20 02:35:32', 'PSP', '264.70', 'THB');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (26, 72, 91, 39, '2020-03-08 05:11:53', '2020-02-29 09:45:24', 'CMD', '107.65', 'CNY');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (27, 78, 70, 1, '2019-05-16 19:02:17', '2019-11-28 12:28:24', 'APP', '329.52', 'PHP');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (28, 65, 64, 89, '2019-08-04 11:02:55', '2020-01-15 01:29:18', 'PDG', '287.78', 'CZK');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (29, 22, 29, 19, '2019-12-31 05:13:45', '2020-01-30 20:39:12', 'PSP', '63.40', 'BRL');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (30, 53, 74, 79, '2019-10-08 05:44:41', '2019-06-29 16:35:05', 'ASM', '33.61', 'CNY');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (31, 61, 31, 9, '2020-02-10 14:36:13', '2020-04-14 20:34:58', 'DCD', '26.01', 'BRL');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (32, 11, 39, 83, '2019-09-30 11:47:06', '2019-09-27 20:23:10', 'APM', '54.35', 'PEN');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (33, 94, 56, 58, '2019-06-29 23:11:07', '2019-09-19 21:53:40', 'DCD', '58.98', 'TJS');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (34, 59, 83, 96, '2019-06-23 20:41:10', '2019-06-18 00:12:01', 'DCD', '125.27', 'BRL');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (35, 25, 95, 2, '2019-07-05 20:12:44', '2019-05-23 05:05:03', 'APM', '195.90', 'CNY');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (36, 88, 20, 96, '2019-07-11 00:35:55', '2019-07-31 20:03:31', 'ASM', '288.08', 'ARS');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (37, 10, 47, 95, '2019-12-01 21:41:37', '2019-08-31 23:28:52', 'DCD', '39.79', 'CNY');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (38, 40, 27, 47, '2019-09-14 05:20:09', '2019-04-28 05:55:24', 'APP', '106.98', 'AUD');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (39, 37, 62, 5, '2019-09-27 17:37:11', '2019-07-28 20:46:53', 'PDG', '272.63', 'CNY');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (40, 80, 65, 73, '2019-07-16 05:23:23', '2019-09-06 16:56:46', 'PDG', '102.73', 'XOF');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (41, 60, 36, 94, '2019-11-20 04:33:22', '2019-11-16 21:40:55', 'APM', '157.87', 'CNY');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (42, 78, 75, 99, '2020-01-10 15:59:30', '2019-08-11 21:21:47', 'DCD', '264.30', 'CNY');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (43, 38, 61, 27, '2020-03-25 16:01:19', '2019-07-27 16:50:07', 'CCD', '219.30', 'TRY');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (44, 64, 50, 39, '2020-03-09 01:26:56', '2019-11-25 22:39:24', 'CMD', '174.46', 'XOF');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (45, 91, 55, 56, '2019-10-19 16:02:31', '2020-04-16 03:21:10', 'CCD', '121.95', 'IDR');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (46, 85, 23, 9, '2019-06-01 00:53:13', '2020-03-29 20:16:11', 'SPD', '46.44', 'IDR');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (47, 90, 72, 13, '2019-12-10 20:27:44', '2020-03-23 22:38:19', 'APP', '148.40', 'PHP');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (48, 11, 22, 76, '2019-09-19 18:00:02', '2020-04-19 04:36:12', 'APM', '78.59', 'EUR');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (49, 44, 10, 85, '2019-12-24 06:02:23', '2019-08-09 19:31:05', 'PDG', '233.57', 'THB');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (50, 66, 2, 10, '2019-07-01 12:25:30', '2019-05-28 06:00:16', 'APM', '218.62', 'MXN');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (51, 94, 88, 99, '2019-05-24 05:57:57', '2020-02-25 16:50:03', 'SPD', '171.71', 'PLN');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (52, 95, 26, 67, '2019-11-20 17:28:37', '2019-09-01 20:49:21', 'APM', '207.42', 'EUR');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (53, 7, 3, 92, '2019-06-17 18:13:51', '2019-07-19 07:14:14', 'CMD', '80.40', 'SEK');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (54, 31, 82, 1, '2019-08-06 15:59:17', '2020-01-14 15:40:04', 'AFM', '322.94', 'COP');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (55, 95, 43, 81, '2019-11-25 06:06:33', '2019-10-23 03:20:36', 'AFM', '285.53', 'PEN');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (56, 58, 58, 23, '2019-07-16 14:19:19', '2019-08-11 13:21:33', 'SPD', '114.96', 'BRL');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (57, 73, 68, 6, '2019-12-09 05:48:05', '2019-12-27 17:24:41', 'DCD', '117.26', 'CZK');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (58, 18, 62, 76, '2020-03-31 10:40:21', '2019-07-13 06:42:42', 'AFM', '73.63', 'LYD');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (59, 11, 50, 12, '2019-10-09 11:33:33', '2019-05-06 04:51:27', 'AFM', '92.59', 'CDF');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (60, 93, 44, 2, '2020-04-01 15:15:57', '2019-10-25 09:43:36', 'DCD', '334.55', 'SYP');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (61, 58, 97, 63, '2020-01-19 00:40:35', '2019-10-26 09:03:03', 'SPD', '35.74', 'THB');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (62, 40, 94, 7, '2020-02-04 07:07:55', '2019-06-12 18:15:54', 'CCD', '246.43', 'CNY');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (63, 28, 61, 20, '2019-11-02 07:57:29', '2020-04-07 12:57:01', 'DCD', '146.00', 'GNF');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (64, 97, 31, 53, '2019-08-27 07:47:29', '2020-03-28 01:27:30', 'APP', '37.37', 'USD');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (65, 93, 31, 68, '2020-02-03 20:42:01', '2020-04-07 06:06:21', 'PDG', '298.37', 'CNY');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (66, 78, 97, 23, '2019-09-14 13:54:05', '2020-01-27 19:11:34', 'APP', '164.22', 'EUR');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (67, 77, 87, 16, '2020-01-10 22:55:08', '2019-09-07 11:24:34', 'CMD', '44.81', 'PHP');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (68, 43, 21, 37, '2019-09-10 18:15:00', '2019-04-30 05:25:16', 'PDG', '292.21', 'PLN');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (69, 18, 46, 33, '2020-04-04 00:57:00', '2020-04-15 15:35:18', 'PDG', '261.05', 'MXN');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (70, 81, 85, 74, '2019-09-13 00:26:57', '2019-07-02 07:56:45', 'AFM', '38.28', 'JPY');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (71, 43, 34, 57, '2019-07-22 14:28:13', '2019-12-16 02:38:46', 'DCD', '269.82', 'SEK');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (72, 13, 27, 69, '2020-01-21 20:54:15', '2019-05-21 10:38:55', 'APP', '118.21', 'NZD');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (73, 71, 61, 22, '2020-04-09 14:17:12', '2019-11-10 10:19:14', 'PSP', '318.26', 'CNY');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (74, 49, 77, 12, '2019-08-21 14:41:34', '2019-11-01 07:29:32', 'APM', '231.15', 'PLN');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (75, 95, 37, 42, '2019-09-03 05:53:19', '2019-12-05 13:49:40', 'DCD', '180.07', 'PLN');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (76, 88, 56, 90, '2020-01-08 16:33:50', '2019-06-09 05:18:07', 'AFM', '296.10', 'IDR');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (77, 46, 63, 60, '2020-02-23 22:31:41', '2019-10-10 14:04:03', 'ASM', '30.58', 'IDR');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (78, 33, 76, 21, '2019-04-22 21:09:20', '2019-05-14 14:22:32', 'ASM', '49.15', 'CNY');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (79, 8, 84, 49, '2019-06-18 06:43:28', '2019-07-21 08:29:11', 'ASM', '94.43', 'CNY');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (80, 13, 3, 54, '2020-03-18 01:43:54', '2020-04-16 08:21:14', 'CCD', '305.31', 'IDR');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (81, 64, 60, 25, '2019-08-02 18:11:10', '2019-10-02 21:34:54', 'DCD', '134.87', 'RUB');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (82, 84, 15, 89, '2019-09-17 21:30:10', '2019-06-19 08:31:06', 'PSP', '175.03', 'CNY');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (83, 45, 59, 64, '2019-06-01 04:42:40', '2020-02-22 07:09:14', 'APP', '320.32', 'TJS');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (84, 42, 39, 70, '2019-05-16 03:25:14', '2019-07-05 06:52:55', 'CCD', '112.15', 'ZAR');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (85, 74, 50, 36, '2019-08-21 21:57:46', '2020-02-10 14:43:47', 'PDG', '22.56', 'ARS');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (86, 30, 12, 77, '2020-01-09 11:32:45', '2019-09-17 12:04:29', 'CMD', '330.34', 'CNY');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (87, 15, 60, 57, '2019-12-17 17:51:30', '2019-12-13 06:11:00', 'ASM', '318.69', 'EUR');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (88, 88, 89, 9, '2019-05-08 04:49:07', '2019-09-21 12:35:37', 'DCD', '175.30', 'CNY');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (89, 95, 36, 66, '2020-02-09 19:15:39', '2020-01-22 06:27:58', 'SPD', '52.09', 'USD');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (90, 43, 95, 44, '2019-12-15 13:31:06', '2019-05-29 01:40:49', 'CMD', '297.40', 'MXN');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (91, 7, 89, 88, '2020-03-15 14:54:31', '2019-05-23 07:12:49', 'PSP', '272.79', 'RUB');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (92, 1, 68, 92, '2019-08-26 03:36:01', '2019-05-25 19:49:44', 'AFM', '313.15', 'IDR');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (93, 3, 20, 20, '2019-12-20 05:55:39', '2019-10-24 10:12:03', 'PDG', '126.11', 'CNY');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (94, 25, 94, 88, '2019-04-28 08:09:55', '2019-06-17 14:29:07', 'SPD', '191.51', 'PHP');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (95, 85, 33, 82, '2019-10-29 21:57:00', '2020-03-13 15:19:01', 'DCD', '57.99', 'CNY');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (96, 61, 99, 20, '2019-12-07 06:04:46', '2019-10-31 23:48:26', 'CMD', '37.60', 'CNY');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (97, 31, 64, 17, '2019-12-01 03:57:19', '2019-11-28 18:26:08', 'ASM', '230.70', 'CNY');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (98, 36, 87, 53, '2019-11-25 14:19:29', '2019-09-20 22:06:40', 'ASM', '275.58', 'BRL');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (99, 6, 17, 74, '2019-07-25 05:52:06', '2019-07-19 13:44:36', 'SPD', '292.81', 'CNY');
insert into orders (id, user_id, address_id, discount_id, created, modified, status, amount, currency) values (100, 40, 26, 73, '2019-04-23 03:51:40', '2020-02-20 14:58:47', 'ASM', '45.55', 'ALL');