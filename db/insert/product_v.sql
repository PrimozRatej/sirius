SELECT SYSDATE() as timestamp, 'start product_v.sql' as decsription;
insert into product
    (id, 
    category_id, 
    barcode_url, 
    name, 
    description, 
    image_url, 
    video_url_yt, 
    price, 
    currency_code)
values
    (1, 
    1, 
    'https://drive.google.com/uc?id=1v4rxxusnJW1Jj2Osjn5TVrpENTES5qK1',
    'Nike Kyrie 7', 
    'Bearing a strong resemblance to the Kyrie 1, the Kyrie 7 has a mesh-infused upper and tooth-like edges formed atop the lateral forefoot. The heels are embroidered with Kyrie‘s signature and an inscription in the bottom heel region spells out “His Legacy Is Going To Live Forever”, a quote referencing Kobe Bryant.', 
    'https://drive.google.com/uc?id=10My7c0CNds52BXsStxoHD6L2J401WIk9',
    'https://www.youtube.com/watch?v=GU7Qwhsh8TA', 
    119.99, 
    'EUR');


insert into product
    (id, 
    category_id, 
    barcode_url, 
    name, 
    description, 
    image_url, 
    video_url_yt, 
    price, 
    currency_code)
values
    (2, 
    1, 
    'https://drive.google.com/uc?id=1O7HKaf9R71f4selqdK7QHqOucnpyTWUX',
    'Nike Air Max', 
    'Celebrating the 25th anniversary of the Air Max 95, the Nike Air Max ZM950 warps the OG\'s iconic side panels, adds fully visible Nike Air cushioning and boasts colours that express its attitude: untouchable, confident and tough.', 
    'https://drive.google.com/uc?id=1Y0mYaFbXbye8RnGvjvRSpOPCiiEO6KsU',
    'https://www.youtube.com/watch?v=zGrYiMaAlJs', 
    179.99, 
    'EUR');

 insert into product
    (id, 
    category_id, 
    barcode_url, 
    name, 
    description, 
    image_url, 
    video_url_yt, 
    price, 
    currency_code)
values
    (3, 
    1, 
    'https://drive.google.com/uc?id=1yUl6wyO7ct3j8rpWY4qm2rKGyDbtx_nu',
    'Nike Blazer Mid \'77 Vintage', 
    'In the \'70s, Nike was the new shoe on the block. So new in fact, we were still breaking into the basketball scene and testing prototypes on the feet of our local team. Of course, the design improved over the years, but the name stuck. The Nike Blazer Mid \'77 Vintage—classic from the beginning.', 
    'https://drive.google.com/uc?id=1L0_RxjNdzIDa2uCCLw9EfpUHAHtO7ueT',
    'https://www.youtube.com/watch?v=XWTpLsDKKCQ', 
    99.99, 
    'EUR');

