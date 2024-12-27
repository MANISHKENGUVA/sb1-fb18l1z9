/*
  # Initial Restaurant App Schema

  1. New Tables
    - dishes
      - id (uuid, primary key)
      - name (text)
      - description (text)
      - price (numeric)
      - image_url (text)
      - category (text)
      - created_at (timestamp)
    
    - orders
      - id (uuid, primary key)
      - user_id (uuid, references auth.users)
      - total (numeric)
      - status (text)
      - items (jsonb)
      - created_at (timestamp)

  2. Security
    - Enable RLS on all tables
    - Add policies for authenticated users
*/

-- Create dishes table
CREATE TABLE IF NOT EXISTS dishes (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  description text NOT NULL,
  price numeric NOT NULL CHECK (price > 0),
  image_url text NOT NULL,
  category text NOT NULL,
  created_at timestamptz DEFAULT now()
);

-- Create orders table
CREATE TABLE IF NOT EXISTS orders (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES auth.users NOT NULL,
  total numeric NOT NULL CHECK (total >= 0),
  status text NOT NULL CHECK (status IN ('pending', 'confirmed', 'completed', 'cancelled')),
  items jsonb NOT NULL,
  created_at timestamptz DEFAULT now()
);

-- Enable RLS
ALTER TABLE dishes ENABLE ROW LEVEL SECURITY;
ALTER TABLE orders ENABLE ROW LEVEL SECURITY;

-- Dishes policies
CREATE POLICY "Anyone can view dishes"
  ON dishes
  FOR SELECT
  TO authenticated, anon
  USING (true);

-- Orders policies
CREATE POLICY "Users can view their own orders"
  ON orders
  FOR SELECT
  TO authenticated
  USING (auth.uid() = user_id);

CREATE POLICY "Users can create their own orders"
  ON orders
  FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid() = user_id);

-- Insert sample dishes
INSERT INTO dishes (name, description, price, image_url, category) VALUES
('Margherita Pizza', 'Fresh tomatoes, mozzarella, and basil', 14.99, 'https://images.unsplash.com/photo-1604068549290-dea0e4a305ca', 'main'),
('Caesar Salad', 'Romaine lettuce, croutons, parmesan', 9.99, 'https://images.unsplash.com/photo-1550304943-4f24f54ddde9', 'appetizer'),
('Tiramisu', 'Classic Italian dessert', 7.99, 'https://images.unsplash.com/photo-1571877227200-a0d98ea607e9', 'dessert');