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
    'https://i.imgur.com/5o1Rj16.png',
    'Nike Kyrie 7', 
    'Bearing a strong resemblance to the Kyrie 1, the Kyrie 7 has a mesh-infused upper and tooth-like edges formed atop the lateral forefoot. The heels are embroidered with Kyrie‘s signature and an inscription in the bottom heel region spells out “His Legacy Is Going To Live Forever”, a quote referencing Kobe Bryant.', 
    'https://i.imgur.com/PTjYCG3.png',
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
    'https://i.imgur.com/rSzgxMh.png',
    'Nike Air Max', 
    'Celebrating the 25th anniversary of the Air Max 95, the Nike Air Max ZM950 warps the OG\'s iconic side panels, adds fully visible Nike Air cushioning and boasts colours that express its attitude: untouchable, confident and tough.', 
    'https://i.imgur.com/eefTl91.png',
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
    'https://i.imgur.com/HfpeKfp.png',
    'Nike Blazer Mid \'77 Vintage', 
    'In the \'70s, Nike was the new shoe on the block. So new in fact, we were still breaking into the basketball scene and testing prototypes on the feet of our local team. Of course, the design improved over the years, but the name stuck. The Nike Blazer Mid \'77 Vintage—classic from the beginning.', 
    'https://i.imgur.com/EUy6bKX.png',
    'https://www.youtube.com/watch?v=XWTpLsDKKCQ', 
    99.99, 
    'EUR');

