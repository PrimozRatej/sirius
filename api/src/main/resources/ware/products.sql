SELECT
prod.id,
prod.image_url,
prod.barcode_url,
prod.name,
invit.quantity,
invit.quantity_type
FROM sirius.product prod
JOIN sirius.inventory_item invit
ON prod.id=invit.product_id;

