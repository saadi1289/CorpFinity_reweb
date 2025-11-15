import React from 'react';

interface EnergySelectionProps {
  selectedEnergy: string;
  onEnergySelect: (energy: string) => void;
}

export default function EnergySelection({ selectedEnergy, onEnergySelect }: EnergySelectionProps) {
  const energyLevels = [
    {
      id: 'low',
      title: 'Low Energy',
      description: 'Feeling tired, need gentle activities',
      icon: '🔋',
      color: 'bg-red-50 border-red-200 hover:border-red-300',
      selectedColor: 'border-teal-500 bg-teal-50',
      activities: ['Deep breathing', 'Gentle stretches', 'Mindful moments']
    },
    {
      id: 'medium',
      title: 'Medium Energy',
      description: 'Feeling okay, ready for moderate activities',
      icon: '⚡',
      color: 'bg-yellow-50 border-yellow-200 hover:border-yellow-300',
      selectedColor: 'border-teal-500 bg-teal-50',
      activities: ['Desk yoga', 'Walking meditation', 'Breathing exercises']
    },
    {
      id: 'high',
      title: 'High Energy',
      description: 'Feeling great, ready for active challenges',
      icon: '🚀',
      color: 'bg-green-50 border-green-200 hover:border-green-300',
      selectedColor: 'border-teal-500 bg-teal-50',
      activities: ['Full body stretches', 'Active meditation', 'Energy flows']
    }
  ];

  return (
    <div className="space-y-6">
      {/* Title and Illustration */}
      <div className="text-center mb-8">
        <div className="mb-6">
          <img 
            src="/assets/illustrations/battery_illustration.svg" 
            alt="Energy Level" 
            className="w-32 h-32 mx-auto"
          />
        </div>
        <h3 className="text-2xl font-bold text-gray-800 mb-2">
          How are you feeling right now?
        </h3>
        <p className="text-gray-600">
          Choose your current energy level to get personalized activities
        </p>
      </div>

      {/* Energy Level Options */}
      <div className="space-y-4">
        {energyLevels.map((level) => (
          <button
            key={level.id}
            onClick={() => onEnergySelect(level.id)}
            className={`w-full p-6 rounded-2xl border-2 transition-all duration-200 text-left ${
              selectedEnergy === level.id
                ? level.selectedColor
                : level.color
            }`}
          >
            <div className="flex items-start space-x-4">
              <div className="text-3xl">{level.icon}</div>
              <div className="flex-1">
                <div className="flex items-center justify-between mb-2">
                  <h4 className="text-lg font-semibold text-gray-800">
                    {level.title}
                  </h4>
                  {selectedEnergy === level.id && (
                    <div className="w-6 h-6 bg-teal-500 rounded-full flex items-center justify-center">
                      <svg className="w-4 h-4 text-white" fill="currentColor" viewBox="0 0 20 20">
                        <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd" />
                      </svg>
                    </div>
                  )}
                </div>
                <p className="text-gray-600 mb-3">{level.description}</p>
                <div className="flex flex-wrap gap-2">
                  {level.activities.map((activity, index) => (
                    <span
                      key={index}
                      className="text-xs bg-white bg-opacity-70 text-gray-700 px-2 py-1 rounded-full"
                    >
                      {activity}
                    </span>
                  ))}
                </div>
              </div>
            </div>
          </button>
        ))}
      </div>

      {/* Helper Text */}
      <div className="text-center mt-8">
        <p className="text-sm text-gray-500">
          Don't worry, you can always adjust this later
        </p>
      </div>
    </div>
  );
}