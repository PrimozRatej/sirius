SELECT SYSDATE() as timestamp, 'start product_details_v.sql' as decsription;
INSERT INTO product_details
	(id, product_id, company, model, color, img_url, img_url2, img_url3)
values
	(1, 1, 'Nike', 'Kyrie 7', 'black/red', 'https://i.imgur.com/SVXFzK4.png', NULL, NULL);

