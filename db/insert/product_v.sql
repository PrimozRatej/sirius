SELECT SYSDATE() as timestamp, 'start product_v.sql' as decsription;
insert into product
    (id, category_id, barcode_num, barcode_url, name, description, image_url, video_url_yt, price, currency_code)
values
    (1, 1, '000000000001', 'https://i.imgur.com/ZHS0sEC.gif', 'Nike Kyrie 7', 'Bearing a strong resemblance to the Kyrie 1, the Kyrie 7 has a mesh-infused upper and tooth-like edges formed atop the lateral forefoot. The heels are embroidered with Kyrie‘s signature and an inscription in the bottom heel region spells out “His Legacy Is Going To Live Forever”, a quote referencing Kobe Bryant.', 'https://i.imgur.com/SVXFzK4.png', 'https://www.youtube.com/watch?v=GU7Qwhsh8TA', 119.99, 'EUR');
