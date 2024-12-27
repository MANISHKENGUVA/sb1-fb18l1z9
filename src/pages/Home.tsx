import React from 'react';
import { useNavigate } from 'react-router-dom';
import { UtensilsCrossed } from 'lucide-react';

export default function Home() {
  const navigate = useNavigate();

  return (
    <div className="text-center py-12">
      <UtensilsCrossed className="w-16 h-16 mx-auto mb-6 text-indigo-600" />
      <h1 className="text-4xl font-bold mb-4">Welcome to Gourmet Haven</h1>
      <p className="text-xl text-gray-600 mb-8 max-w-2xl mx-auto">
        Experience culinary excellence with our carefully curated menu of
        delectable dishes prepared by expert chefs.
      </p>
      <button
        onClick={() => navigate('/menu')}
        className="bg-indigo-600 text-white px-8 py-3 rounded-md text-lg hover:bg-indigo-700"
      >
        View Menu
      </button>
    </div>
  );
}