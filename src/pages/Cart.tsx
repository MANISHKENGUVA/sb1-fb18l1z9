import React from 'react';
import { useNavigate } from 'react-router-dom';
import { Minus, Plus, Trash2 } from 'lucide-react';
import { useCartStore } from '../stores/cartStore';
import { useAuthStore } from '../stores/authStore';
import { supabase } from '../lib/supabase';
import { toast } from 'react-hot-toast';

export default function Cart() {
  const { items, removeItem, updateQuantity, clearCart, getTotal } = useCartStore();
  const { user } = useAuthStore();
  const navigate = useNavigate();

  const handlePlaceOrder = async () => {
    if (!user) {
      toast.error('Please sign in to place an order');
      navigate('/auth');
      return;
    }

    try {
      const { error } = await supabase.from('orders').insert({
        user_id: user.id,
        total: getTotal(),
        status: 'pending',
        items: items,
      });

      if (error) throw error;

      clearCart();
      toast.success('Order placed successfully!');
      navigate('/orders');
    } catch (error) {
      toast.error('Failed to place order');
    }
  };

  if (items.length === 0) {
    return (
      <div className="text-center py-12">
        <h2 className="text-2xl font-bold mb-4">Your cart is empty</h2>
        <button
          onClick={() => navigate('/menu')}
          className="bg-indigo-600 text-white px-6 py-2 rounded-md hover:bg-indigo-700"
        >
          Browse Menu
        </button>
      </div>
    );
  }

  return (
    <div className="max-w-4xl mx-auto">
      <h1 className="text-3xl font-bold mb-8">Your Cart</h1>

      <div className="bg-white rounded-lg shadow-md p-6 mb-6">
        {items.map((item) => (
          <div
            key={item.dish.id}
            className="flex items-center py-4 border-b last:border-b-0"
          >
            <img
              src={item.dish.image_url}
              alt={item.dish.name}
              className="w-24 h-24 object-cover rounded-md"
            />
            <div className="ml-4 flex-grow">
              <h3 className="text-lg font-semibold">{item.dish.name}</h3>
              <p className="text-gray-600">${item.dish.price.toFixed(2)}</p>
            </div>
            <div className="flex items-center space-x-4">
              <div className="flex items-center space-x-2">
                <button
                  onClick={() => updateQuantity(item.dish.id, Math.max(1, item.quantity - 1))}
                  className="p-1 rounded-md hover:bg-gray-100"
                >
                  <Minus className="w-4 h-4" />
                </button>
                <span className="w-8 text-center">{item.quantity}</span>
                <button
                  onClick={() => updateQuantity(item.dish.id, item.quantity + 1)}
                  className="p-1 rounded-md hover:bg-gray-100"
                >
                  <Plus className="w-4 h-4" />
                </button>
              </div>
              <button
                onClick={() => removeItem(item.dish.id)}
                className="text-red-500 hover:text-red-600"
              >
                <Trash2 className="w-5 h-5" />
              </button>
            </div>
          </div>
        ))}

        <div className="mt-6 border-t pt-6">
          <div className="flex justify-between text-lg font-semibold mb-2">
            <span>Subtotal:</span>
            <span>
              ${items
                .reduce((total, item) => total + item.dish.price * item.quantity, 0)
                .toFixed(2)}
            </span>
          </div>
          <div className="flex justify-between text-lg font-semibold mb-4">
            <span>Tax (10%):</span>
            <span>
              ${(
                items.reduce(
                  (total, item) => total + item.dish.price * item.quantity,
                  0
                ) * 0.1
              ).toFixed(2)}
            </span>
          </div>
          <div className="flex justify-between text-xl font-bold">
            <span>Total:</span>
            <span>${getTotal().toFixed(2)}</span>
          </div>

          <button
            onClick={handlePlaceOrder}
            className="w-full mt-6 bg-indigo-600 text-white py-3 rounded-md hover:bg-indigo-700"
          >
            Place Order
          </button>
        </div>
      </div>
    </div>
  );
}