SELECT TOP (1000) [restaurant_id]
      ,[restaurant_name]
      ,[location]
      ,[cuisine_type]
      ,[menu_item]
      ,[price]
      ,[cost]
      ,[rating]
      ,[review_count]
      ,[staff_count]
      ,[opening_hours]
      ,[closing_hours]
      ,[delivery_available]
      ,[takeaway_available]
      ,[reservation_required]
      ,[seating_capacity]
      ,[owner_name]
      ,[contact_number]
      ,[email]
      ,[website]
  FROM [SQL classes].[dbo].[restaurant_dataset]
  

  SELECT * FROM restaurant_dataset

  SELECT * FROM restaurant_operations_dataset

  SELECT COUNT(restaurant_id) FROM restaurant_dataset 

  SELECT COUNT(restaurant_id) FROM restaurant_operations_dataset

SELECT * FROM restaurant_dataset 
FULL OUTER JOIN restaurant_operations_dataset 
ON restaurant_dataset.restaurant_id= restaurant_operations_dataset.restaurant_id,


SELECT * FROM restaurant_dataset 
RIGHT OUTER JOIN restaurant_operations_dataset 
ON restaurant_dataset.restaurant_id= restaurant_operations_dataset.restaurant_id



SELECT  restaurant_dataset.restaurant_name, restaurant_dataset.email, restaurant_dataset.price
FROM restaurant_dataset
INNER JOIN restaurant_operations_dataset
ON restaurant_dataset.restaurant_id=restaurant_operations_dataset.restaurant_id

SELECT restaurant_operations_dataset.restaurant_name, restaurant_operations_dataset.email, restaurant_operations_dataset.price
FROM restaurant_operations_dataset
INNER JOIN restaurant_dataset 
ON restaurant_dataset.restaurant_id= restaurant_operations_dataset.restaurant_id



SELECT restaurant_id, email, price
FROM restaurant_dataset
UNION
SELECT restaurant_id, email, price 
FROM restaurant_operations_dataset

SELECT restaurant_name, email, price, 
CASE 
WHEN price > 40 THEN 'expensive' ELSE 'affordable'
END
AS situation FROM restaurant_dataset


SELECT restaurant_name, email, price, 
CASE 
WHEN price > 40 THEN 'expensive' 
WHEN price BETWEEN 35 AND 39 THEN 'affordable'
ELSE 'cheap' 
END
AS situation FROM restaurant_dataset

SELECT restaurant_id, restaurant_name, cuisine_type, menu_item, price,
CASE
WHEN menu_item ='Pizza' THEN price + (price * .08)
WHEN menu_item ='Spaghetti Bolognese' THEN price + (price * .05)
WHEN menu_item ='Moi Moi' THEN price + (price * .03)
ELSE price + (price * 02)
END
AS PriceAdjustment
FROM restaurant_dataset


SELECT restaurant_id, restaurant_name, cuisine_type, menu_item, price,
CASE
WHEN menu_item ='Pizza' THEN (price  -10)
WHEN menu_item ='Spaghetti Bolognese' THEN  (price  -5)
WHEN menu_item ='Moi Moi' THEN (price  -15)
ELSE price + (price +02)
END
AS PriceAdjustment
FROM restaurant_dataset

SELECT  restaurant_dataset.menu_item,
COUNT (restaurant_dataset.menu_item)
AS quantity
FROM restaurant_dataset
JOIN restaurant_operations_dataset
ON restaurant_dataset.restaurant_id=restaurant_operations_dataset.restaurant_id
GROUP BY restaurant_dataset.menu_item
HAVING COUNT (restaurant_dataset.menu_item)<= '15'


SELECT * FROM restaurant_dataset


UPDATE restaurant_dataset 
SET location = 'kuje'
WHERE menu_item='Pounded Yam'


DELETE FROM restaurant_dataset
WHERE restaurant_id=2

ALTER TABLE restaurant_dataset
ADD drink_menu VARCHAR(50)

SELECT * FROM restaurant_dataset

UPDATE restaurant_dataset
SET drink_menu = 'coke'
WHERE menu_item IN ('Akara', 'Fried Rice', 'Moi Moi')


UPDATE restaurant_dataset
SET drink_menu = 'virgin mojito'
WHERE menu_item IN ('Efo Riro', 'Pizza', 'Fried Chicken')

UPDATE restaurant_dataset
SET drink_menu = 'fanta'
WHERE menu_item IN ('Suya', 'Burger', 'Ofada Rice')


