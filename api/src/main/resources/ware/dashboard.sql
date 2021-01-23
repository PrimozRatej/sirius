SELECT
(SELECT COUNT(*) FROM sirius.order WHERE sirius.order.order_status_code LIKE 'AFF') as 'quaToPacked',
(SELECT COUNT(*) FROM sirius.order WHERE sirius.order.order_status_code LIKE 'ATS') as 'packToShiped',
(SELECT COUNT(*) FROM sirius.order WHERE sirius.order.order_status_code LIKE 'SHP') as 'packToBeDelivered',
(SELECT COUNT(*) FROM sirius.order WHERE sirius.order.order_status_code LIKE 'PRE') as 'packToBeInvoice',
(SELECT COUNT(*) FROM sirius.order WHERE sirius.order.order_status_code LIKE 'COM') as 'inHand',
(SELECT COUNT(*) FROM sirius.order WHERE sirius.order.order_status_code LIKE 'PLS') as 'toBeReceived'
FROM DUAL;