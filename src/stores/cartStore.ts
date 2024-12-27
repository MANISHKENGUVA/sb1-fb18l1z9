import { create } from 'zustand';
import type { CartItem, Dish } from '../types';

interface CartState {
  items: CartItem[];
  addItem: (dish: Dish, quantity: number) => void;
  removeItem: (dishId: string) => void;
  updateQuantity: (dishId: string, quantity: number) => void;
  clearCart: () => void;
  getTotal: () => number;
}

export const useCartStore = create<CartState>((set, get) => ({
  items: [],
  addItem: (dish, quantity) => {
    set((state) => {
      const existingItem = state.items.find((item) => item.dish.id === dish.id);
      if (existingItem) {
        return {
          items: state.items.map((item) =>
            item.dish.id === dish.id
              ? { ...item, quantity: item.quantity + quantity }
              : item
          ),
        };
      }
      return { items: [...state.items, { dish, quantity }] };
    });
  },
  removeItem: (dishId) => {
    set((state) => ({
      items: state.items.filter((item) => item.dish.id !== dishId),
    }));
  },
  updateQuantity: (dishId, quantity) => {
    set((state) => ({
      items: state.items.map((item) =>
        item.dish.id === dishId ? { ...item, quantity } : item
      ),
    }));
  },
  clearCart: () => set({ items: [] }),
  getTotal: () => {
    const items = get().items;
    const subtotal = items.reduce(
      (total, item) => total + item.dish.price * item.quantity,
      0
    );
    const tax = subtotal * 0.1; // 10% tax
    return subtotal + tax;
  },
}));