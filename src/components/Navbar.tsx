import React from 'react';
import { Link } from 'react-router-dom';
import { ShoppingCart, User, History, Menu as MenuIcon } from 'lucide-react';
import { useAuthStore } from '../stores/authStore';
import { useCartStore } from '../stores/cartStore';

export default function Navbar() {
  const { user, signOut } = useAuthStore();
  const items = useCartStore((state) => state.items);

  return (
    <nav className="bg-white shadow-lg">
      <div className="container mx-auto px-4">
        <div className="flex justify-between items-center h-16">
          <Link to="/" className="text-xl font-bold text-gray-800">
            Gourmet Haven
          </Link>

          <div className="flex items-center space-x-4">
            <Link to="/menu" className="flex items-center text-gray-600 hover:text-gray-800">
              <MenuIcon className="w-5 h-5 mr-1" />
              Menu
            </Link>
            
            {user ? (
              <>
                <Link to="/cart" className="flex items-center text-gray-600 hover:text-gray-800">
                  <ShoppingCart className="w-5 h-5 mr-1" />
                  Cart ({items.length})
                </Link>
                
                <Link to="/orders" className="flex items-center text-gray-600 hover:text-gray-800">
                  <History className="w-5 h-5 mr-1" />
                  Orders
                </Link>
                
                <button
                  onClick={() => signOut()}
                  className="flex items-center text-gray-600 hover:text-gray-800"
                >
                  <User className="w-5 h-5 mr-1" />
                  Sign Out
                </button>
              </>
            ) : (
              <Link
                to="/auth"
                className="flex items-center text-gray-600 hover:text-gray-800"
              >
                <User className="w-5 h-5 mr-1" />
                Sign In
              </Link>
            )}
          </div>
        </div>
      </div>
    </nav>
  );
}