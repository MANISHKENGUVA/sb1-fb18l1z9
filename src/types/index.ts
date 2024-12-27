export interface User {
  id: string;
  email: string;
  created_at: string;
}

export interface Dish {
  id: string;
  name: string;
  description: string;
  price: number;
  image_url: string;
  category: string;
  created_at: string;
}

export interface CartItem {
  dish: Dish;
  quantity: number;
}

export interface Order {
  id: string;
  user_id: string;
  total: number;
  status: 'pending' | 'confirmed' | 'completed' | 'cancelled';
  created_at: string;
  items: CartItem[];
}