-- Какие компании производители есть в базе?

SELECT * FROM manufacturers;

-- Найдите все виды сладостей. 

SELECT name FROM public.sweets_types;

-- В каких городах есть склады?

SELECT DISTINCT city FROM storehouses;

-- Найти сладости с истекшим срок годности. 

SELECT name FROM public.sweets WHERE expiration_date<current_date;

-- Найти сладости, у которых стоимость от 200 до 300

SELECT * FROM public.sweets WHERE cost>='200' AND cost<'300'; 

-- Найти сладости, у которых название начинается на букву М

SELECT * FROM public.sweets WHERE name LIKE 'М%';

-- Составить список сладостей, отсортированных от А до Я

SELECT * FROM public.sweets ORDER BY name

--  Найти количество сладостей по каждому виду. В ответе вывести имя вида и количество

SELECT COUNT (s.id), st.name FROM public.sweets s 
JOIN public.sweets_types st ON s.sweets_types_id = st.id 
GROUP BY st.name;

-- Найти виды сладостей, у которых количество больше 2.

SELECT st.name FROM public.sweets s 
JOIN public.sweets_types st ON s.sweets_types_id = st.id 
GROUP BY st.name
HAVING COUNT (s.id) > 2;

-- Найти производителей, которые есть в более одном городе

SELECT name FROM public.manufacturers
GROUP BY name
HAVING COUNT (city) > 1;

-- В каких городах есть склады со сладостями Мильтик?

SELECT DISTINCT s.city FROM public.storehouses s 
JOIN public.manufacturers_storehouses ms ON s.id = ms.storehouses_id 
JOIN public.sweets sw ON sw.manufacturer_id = ms.manufacturers_id 
WHERE sw.name = 'Мильтик';

-- Какое максимальное значение идентификатора у сладости?

SELECT MAX(id) FROM public.sweets;

-- Какое количество сладостей на каждом складе?

SELECT s.name, COUNT (sw.id) FROM public.storehouses s 
LEFT JOIN public.manufacturers_storehouses ms ON s.id = ms.storehouses_id 
LEFT JOIN public.sweets sw ON sw.manufacturer_id = ms.manufacturers_id 
GROUP BY s.name;

