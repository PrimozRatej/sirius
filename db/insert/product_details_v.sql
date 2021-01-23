SELECT SYSDATE() as timestamp, 'start product_details_v.sql' as decsription;
INSERT INTO product_details
	(id, product_id, company, model, color, img_url, img_url2, img_url3)
values
	(1, 1, 'Nike', 'Kyrie 7', 'black/red', 'https://drive.google.com/uc?id=10My7c0CNds52BXsStxoHD6L2J401WIk9', NULL, NULL);

INSERT INTO product_details
	(id, product_id, company, model, color, img_url, img_url2, img_url3)
values
	(2, 2, 'Nike', 'Air Max ZM950', 'black', 'https://drive.google.com/uc?id=1Y0mYaFbXbye8RnGvjvRSpOPCiiEO6KsU', NULL, NULL);

INSERT INTO product_details
	(id, product_id, company, model, color, img_url, img_url2, img_url3)
values
	(3, 2, 'Nike', 'Air Max ZM950', 'grey', 'https://drive.google.com/uc?id=1sMFdZDGD8_AlWvHklz0ec3hAfvEhPb7G', NULL, NULL);

INSERT INTO product_details
	(id, product_id, company, model, color, img_url, img_url2, img_url3)
values
	(4, 3, 'Nike', 'Blazer Mid \'77 Vintage', 'white', 'https://drive.google.com/uc?id=1L0_RxjNdzIDa2uCCLw9EfpUHAHtO7ueT', NULL, NULL);

