SELECT
prod.id,
prod.image_url,
prod.barcode_url,
prod.name,
invit.quantity,
invit.quantityType
FROM sirius.product prod
JOIN sirius.inventory_item invit
ON prod.id=invit.product_id;