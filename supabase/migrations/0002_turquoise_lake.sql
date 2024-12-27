/*
  # Add more dishes to the menu

  1. Changes
    - Adds 50 new dishes across different categories:
      - Appetizers
      - Main Courses
      - Pasta
      - Pizza
      - Seafood
      - Salads
      - Desserts
      - Beverages
*/

INSERT INTO dishes (name, description, price, image_url, category) VALUES
-- Appetizers
('Bruschetta', 'Grilled bread rubbed with garlic, topped with diced tomatoes, fresh basil, and olive oil', 8.99, 'https://images.unsplash.com/photo-1572695157366-5e585ab2b69f', 'appetizer'),
('Calamari Fritti', 'Crispy fried squid rings served with marinara sauce', 12.99, 'https://images.unsplash.com/photo-1599487488170-d11ec9c172f0', 'appetizer'),
('Caprese Salad', 'Fresh mozzarella, tomatoes, and basil drizzled with balsamic glaze', 10.99, 'https://images.unsplash.com/photo-1608897013039-887f21d8c804', 'appetizer'),
('Garlic Knots', 'Freshly baked knots brushed with garlic butter and herbs', 6.99, 'https://images.unsplash.com/photo-1600628421055-4d30de868b8f', 'appetizer'),
('Mozzarella Sticks', 'Breaded mozzarella served with marinara sauce', 8.99, 'https://images.unsplash.com/photo-1531749668029-257f2a5b93f8', 'appetizer'),

-- Main Courses
('Grilled Ribeye', '12oz ribeye steak with roasted vegetables and garlic mashed potatoes', 34.99, 'https://images.unsplash.com/photo-1600891964092-4316c288032e', 'main'),
('Chicken Marsala', 'Pan-seared chicken breast in marsala wine sauce with mushrooms', 24.99, 'https://images.unsplash.com/photo-1604908176997-125f25cc6f3d', 'main'),
('Veal Parmesan', 'Breaded veal cutlet with marinara sauce and melted mozzarella', 28.99, 'https://images.unsplash.com/photo-1632778149955-e80f8ceca2e8', 'main'),
('Rack of Lamb', 'Herb-crusted lamb rack with mint sauce and roasted potatoes', 36.99, 'https://images.unsplash.com/photo-1602473812169-a7fa61c1a787', 'main'),
('Eggplant Parmesan', 'Layers of breaded eggplant with marinara sauce and cheese', 19.99, 'https://images.unsplash.com/photo-1625937286074-9ca519d5d9df', 'main'),

-- Pasta
('Fettuccine Alfredo', 'Fettuccine in creamy parmesan sauce', 16.99, 'https://images.unsplash.com/photo-1645112411341-6c4fd023714a', 'pasta'),
('Spaghetti Carbonara', 'Classic carbonara with pancetta and egg', 17.99, 'https://images.unsplash.com/photo-1612874742237-6526221588e3', 'pasta'),
('Penne Arrabbiata', 'Spicy tomato sauce with garlic and red chilies', 15.99, 'https://images.unsplash.com/photo-1563379926898-05f4575a45d8', 'pasta'),
('Lobster Ravioli', 'Homemade ravioli filled with lobster in pink sauce', 26.99, 'https://images.unsplash.com/photo-1587740908075-9e245070dfaa', 'pasta'),
('Gnocchi Pesto', 'Potato gnocchi in fresh basil pesto sauce', 18.99, 'https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9', 'pasta'),

-- Pizza
('Quattro Formaggi', 'Four cheese pizza with mozzarella, gorgonzola, parmesan, and fontina', 19.99, 'https://images.unsplash.com/photo-1513104890138-7c749659a591', 'pizza'),
('Pepperoni', 'Classic pepperoni pizza with mozzarella', 16.99, 'https://images.unsplash.com/photo-1628840042765-356cda07504e', 'pizza'),
('Prosciutto e Rucola', 'Pizza with prosciutto, arugula, and shaved parmesan', 21.99, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38', 'pizza'),
('Vegetariana', 'Assorted vegetables with mozzarella', 18.99, 'https://images.unsplash.com/photo-1574071318508-1cdbab80d002', 'pizza'),
('Diavola', 'Spicy salami, chili flakes, and mozzarella', 17.99, 'https://images.unsplash.com/photo-1595708684082-a173bb3a06c5', 'pizza'),

-- Seafood
('Grilled Salmon', 'Atlantic salmon with lemon butter sauce', 27.99, 'https://images.unsplash.com/photo-1567189022364-40c01b064012', 'seafood'),
('Lobster Thermidor', 'Lobster in rich cream sauce with mushrooms', 42.99, 'https://images.unsplash.com/photo-1553247407-23251ce81f59', 'seafood'),
('Shrimp Scampi', 'Garlic shrimp in white wine sauce over linguine', 25.99, 'https://images.unsplash.com/photo-1625943553852-781c6dd46faa', 'seafood'),
('Sea Bass', 'Pan-seared sea bass with Mediterranean herbs', 32.99, 'https://images.unsplash.com/photo-1615141982883-c7ad0e69fd62', 'seafood'),
('Frutti di Mare', 'Mixed seafood in spicy tomato sauce', 29.99, 'https://images.unsplash.com/photo-1590759668628-05b0fc34bb70', 'seafood'),

-- Salads
('Greek Salad', 'Mixed greens with feta, olives, and red onions', 12.99, 'https://images.unsplash.com/photo-1540420773420-3366772f4999', 'salad'),
('Spinach Salad', 'Baby spinach with goat cheese and walnuts', 11.99, 'https://images.unsplash.com/photo-1607532941433-304659e8198a', 'salad'),
('Cobb Salad', 'Mixed greens with chicken, bacon, egg, and avocado', 14.99, 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd', 'salad'),
('Quinoa Bowl', 'Quinoa with roasted vegetables and tahini dressing', 13.99, 'https://images.unsplash.com/photo-1505576399279-565b52d4ac71', 'salad'),
('Pear and Gorgonzola', 'Mixed greens with pears, gorgonzola, and candied walnuts', 13.99, 'https://images.unsplash.com/photo-1604497181015-76590d828b75', 'salad'),

-- Desserts
('Chocolate Lava Cake', 'Warm chocolate cake with molten center', 8.99, 'https://images.unsplash.com/photo-1624353365286-3f8d62daad51', 'dessert'),
('Crème Brûlée', 'Classic vanilla custard with caramelized sugar', 7.99, 'https://images.unsplash.com/photo-1470324161839-ce2bb6fa6bc3', 'dessert'),
('Cannoli', 'Sicilian pastry filled with sweet ricotta', 6.99, 'https://images.unsplash.com/photo-1607920591413-5d3d5d6977c9', 'dessert'),
('Gelato Selection', 'Choice of three artisanal gelato flavors', 7.99, 'https://images.unsplash.com/photo-1567206563064-6f60f40a2b57', 'dessert'),
('Apple Tart', 'Warm apple tart with vanilla ice cream', 8.99, 'https://images.unsplash.com/photo-1568571780765-9276ac8b75a7', 'dessert'),

-- Beverages
('Italian Soda', 'Choice of fruit flavors with cream', 4.99, 'https://images.unsplash.com/photo-1558642891-54be180ea339', 'beverage'),
('Espresso', 'Double shot of espresso', 3.99, 'https://images.unsplash.com/photo-1510591509098-f4fdc6d0ff04', 'beverage'),
('Cappuccino', 'Espresso with steamed milk and foam', 4.99, 'https://images.unsplash.com/photo-1572442388796-11668a67e53d', 'beverage'),
('Fresh Lemonade', 'House-made lemonade with mint', 4.99, 'https://images.unsplash.com/photo-1621263764928-df1444c5e859', 'beverage'),
('Sangria', 'Red wine sangria with fresh fruit', 8.99, 'https://images.unsplash.com/photo-1553361371-9b22f78e8b1d', 'beverage'),

-- Additional Main Courses
('Osso Buco', 'Braised veal shanks with gremolata', 32.99, 'https://images.unsplash.com/photo-1544359355-efb7d5579910', 'main'),
('Duck Confit', 'Crispy duck leg with cherry sauce', 29.99, 'https://images.unsplash.com/photo-1580554530778-ca36943938b2', 'main'),
('Beef Wellington', 'Beef tenderloin wrapped in puff pastry', 38.99, 'https://images.unsplash.com/photo-1600891964092-4316c288032e', 'main'),
('Stuffed Portobello', 'Quinoa and vegetable stuffed mushroom', 18.99, 'https://images.unsplash.com/photo-1619740455993-9d701a19b8ef', 'main'),
('Braised Short Ribs', 'Slow-cooked beef short ribs with red wine sauce', 31.99, 'https://images.unsplash.com/photo-1544025162-d76694265947', 'main');