import React from 'react';
import { supabase } from '../lib/supabase';
import { useCartStore } from '../stores/cartStore';
import type { Dish } from '../types';
import { toast } from 'react-hot-toast';

export default function Menu() {
  const [dishes, setDishes] = React.useState<Dish[]>([]);
  const [selectedCategory, setSelectedCategory] = React.useState<string>('all');
  const addItem = useCartStore((state) => state.addItem);

  React.useEffect(() => {
    const fetchDishes = async () => {
      const { data, error } = await supabase
        .from('dishes')
        .select('*')
        .order('name');
      
      if (error) {
        toast.error('Failed to load menu');
        return;
      }
      
      setDishes(data);
    };

    fetchDishes();
  }, []);

  const categories = ['all', ...new Set(dishes.map((dish) => dish.category))];
  const filteredDishes = selectedCategory === 'all'
    ? dishes
    : dishes.filter((dish) => dish.category === selectedCategory);

  const handleAddToCart = (dish: Dish) => {
    addItem(dish, 1);
    toast.success(`${dish.name} added to cart`);
  };

  return (
    <div>
      <h1 className="text-3xl font-bold mb-8">Our Menu</h1>
      
      <div className="flex space-x-4 mb-8">
        {categories.map((category) => (
          <button
            key={category}
            onClick={() => setSelectedCategory(category)}
            className={`px-4 py-2 rounded-full capitalize ${
              selectedCategory === category
                ? 'bg-indigo-600 text-white'
                : 'bg-gray-200 text-gray-700 hover:bg-gray-300'
            }`}
          >
            {category}
          </button>
        ))}
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        {filteredDishes.map((dish) => (
          <div
            key={dish.id}
            className="bg-white rounded-lg shadow-md overflow-hidden"
          >
            <img
              src={dish.image_url}
              alt={dish.name}
              className="w-full h-48 object-cover"
            />
            <div className="p-4">
              <h3 className="text-xl font-semibold mb-2">{dish.name}</h3>
              <p className="text-gray-600 mb-4">{dish.description}</p>
              <div className="flex justify-between items-center">
                <span className="text-lg font-bold">${dish.price.toFixed(2)}</span>
                <button
                  onClick={() => handleAddToCart(dish)}
                  className="bg-indigo-600 text-white px-4 py-2 rounded-md hover:bg-indigo-700"
                >
                  Add to Cart
                </button>
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}