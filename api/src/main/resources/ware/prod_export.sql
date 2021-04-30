SELECT
   prod.id,
   prod.barcode_url as barcodeUrl,
   prod.category_id as categoryId,
   prod.name,
   prod.description,
   prod.image_url as imageUrl,
   prod.video_url_yt as videoUrlYt,
   prod.price,
   prod.currency_code as currencyCode,
   (
      SELECT
         IFNULL(CAST(SUM(ord_it.quantity) as UNSIGNED), 0 )
      FROM
         sirius.order_item ord_it
         JOIN
            sirius.order ord
            ON ord.id = ord_it.order_id
         JOIN
            sirius.product prod_1
            ON prod_1.id = ord_it.product_id
      WHERE
         ord.order_status_code LIKE 'AFF'
         AND ord_it.product_id = prod.id
   )
   AS 'awaitingFulfillment',
   (
      SELECT
         IFNULL(CAST(SUM(ord_it.quantity) as UNSIGNED), 0 )
      FROM
         sirius.order_item ord_it
         JOIN
            sirius.order ord
            ON ord.id = ord_it.order_id
         JOIN
            sirius.product prod_1
            ON prod_1.id = ord_it.product_id
      WHERE
         ord.order_status_code LIKE 'APT'
         AND ord_it.product_id = prod.id
   )
   AS 'awaitingPayment',
   (
      SELECT
         IFNULL(CAST(SUM(ord_it.quantity) as UNSIGNED), 0 )
      FROM
         sirius.order_item ord_it
         JOIN
            sirius.order ord
            ON ord.id = ord_it.order_id
         JOIN
            sirius.product prod_1
            ON prod_1.id = ord_it.product_id
      WHERE
         ord.order_status_code LIKE 'ATP'
         AND ord_it.product_id = prod.id
   )
   AS 'awaitingPickup',
   (
      SELECT
         IFNULL(CAST(SUM(ord_it.quantity) as UNSIGNED), 0 )
      FROM
         sirius.order_item ord_it
         JOIN
            sirius.order ord
            ON ord.id = ord_it.order_id
         JOIN
            sirius.product prod_1
            ON prod_1.id = ord_it.product_id
      WHERE
         ord.order_status_code LIKE 'ATS'
         AND ord_it.product_id = prod.id
   )
   AS 'awaitingShipment',
   (
      SELECT
         IFNULL(CAST(SUM(inv_it.quantity) as UNSIGNED), 0 )
      FROM
         sirius.product prod_1
         JOIN
            sirius.inventory_item inv_it
            ON prod_1.id = inv_it.product_id
      WHERE
         prod_1.id = prod.id
   )
   AS 'inHand',
   (
      SELECT
         IFNULL(CAST(SUM(ord_it.quantity) as UNSIGNED), 0 )
      FROM
         sirius.order_item ord_it
         JOIN
            sirius.order ord
            ON ord.id = ord_it.order_id
         JOIN
            sirius.product prod_1
            ON prod_1.id = ord_it.product_id
      WHERE
         ord.order_status_code LIKE 'PLS'
         AND ord_it.product_id = prod.id
   )
   AS 'toBeReceived',
   (
      SELECT
         IFNULL(CAST(SUM(ord_it.quantity) as UNSIGNED), 0 )
      FROM
         sirius.order_item ord_it
         JOIN
            sirius.order ord
            ON ord.id = ord_it.order_id
         JOIN
            sirius.product prod_1
            ON prod_1.id = ord_it.product_id
      WHERE
         ord.order_status_code LIKE 'CND'
         AND ord_it.product_id = prod.id
   )
   AS 'cancelled',
   (
      SELECT
         IFNULL(CAST(SUM(ord_it.quantity) as UNSIGNED), 0 )
      FROM
         sirius.order_item ord_it
         JOIN
            sirius.order ord
            ON ord.id = ord_it.order_id
         JOIN
            sirius.product prod_1
            ON prod_1.id = ord_it.product_id
      WHERE
         ord.order_status_code LIKE 'COM'
         AND ord_it.product_id = prod.id
   )
   AS 'completed',
   (
      SELECT
         IFNULL(CAST(SUM(ord_it.quantity) as UNSIGNED), 0 )
      FROM
         sirius.order_item ord_it
         JOIN
            sirius.order ord
            ON ord.id = ord_it.order_id
         JOIN
            sirius.product prod_1
            ON prod_1.id = ord_it.product_id
      WHERE
         ord.order_status_code LIKE 'DEC'
         AND ord_it.product_id = prod.id
   )
   AS 'declined',
   (
      SELECT
         IFNULL(CAST(SUM(ord_it.quantity) as UNSIGNED), 0 )
      FROM
         sirius.order_item ord_it
         JOIN
            sirius.order ord
            ON ord.id = ord_it.order_id
         JOIN
            sirius.product prod_1
            ON prod_1.id = ord_it.product_id
      WHERE
         ord.order_status_code LIKE 'DSP'
         AND ord_it.product_id = prod.id
   )
   AS 'disputed',
   (
      SELECT
         IFNULL(CAST(SUM(ord_it.quantity) as UNSIGNED), 0 )
      FROM
         sirius.order_item ord_it
         JOIN
            sirius.order ord
            ON ord.id = ord_it.order_id
         JOIN
            sirius.product prod_1
            ON prod_1.id = ord_it.product_id
      WHERE
         ord.order_status_code LIKE 'DSP'
         AND ord_it.product_id = prod.id
   )
   AS 'manualVerificationRequired',
   (
      SELECT
         IFNULL(CAST(SUM(ord_it.quantity) as UNSIGNED), 0 )
      FROM
         sirius.order_item ord_it
         JOIN
            sirius.order ord
            ON ord.id = ord_it.order_id
         JOIN
            sirius.product prod_1
            ON prod_1.id = ord_it.product_id
      WHERE
         ord.order_status_code LIKE 'PDG'
         AND ord_it.product_id = prod.id
   )
   AS 'pending',
   (
      SELECT
         IFNULL(CAST(SUM(ord_it.quantity) as UNSIGNED), 0 )
      FROM
         sirius.order_item ord_it
         JOIN
            sirius.order ord
            ON ord.id = ord_it.order_id
         JOIN
            sirius.product prod_1
            ON prod_1.id = ord_it.product_id
      WHERE
         ord.order_status_code LIKE 'PLS'
         AND ord_it.product_id = prod.id
   )
   AS 'partiallyShipped',
   (
      SELECT
         IFNULL(CAST(SUM(ord_it.quantity) as UNSIGNED), 0 )
      FROM
         sirius.order_item ord_it
         JOIN
            sirius.order ord
            ON ord.id = ord_it.order_id
         JOIN
            sirius.product prod_1
            ON prod_1.id = ord_it.product_id
      WHERE
         ord.order_status_code LIKE 'PRE'
         AND ord_it.product_id = prod.id
   )
   AS 'partiallyRefunded',
   (
      SELECT
         IFNULL(CAST(SUM(ord_it.quantity) as UNSIGNED), 0 )
      FROM
         sirius.order_item ord_it
         JOIN
            sirius.order ord
            ON ord.id = ord_it.order_id
         JOIN
            sirius.product prod_1
            ON prod_1.id = ord_it.product_id
      WHERE
         ord.order_status_code LIKE 'REF'
         AND ord_it.product_id = prod.id
   )
   AS 'refunded',
   (
      SELECT
         IFNULL(CAST(SUM(ord_it.quantity) as UNSIGNED), 0 )
      FROM
         sirius.order_item ord_it
         JOIN
            sirius.order ord
            ON ord.id = ord_it.order_id
         JOIN
            sirius.product prod_1
            ON prod_1.id = ord_it.product_id
      WHERE
         ord.order_status_code LIKE 'SHP'
         AND ord_it.product_id = prod.id
   )
   AS 'shipped'
FROM
   sirius.product prod;