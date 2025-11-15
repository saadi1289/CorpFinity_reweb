import React, { useState } from 'react';
import EnergySelection from './components/energy_selection';
import ProgressIndicator from './components/progress_indicator';

export default function ChallengeCreator() {
  const [currentStep, setCurrentStep] = useState(1);
  const [selectedEnergy, setSelectedEnergy] = useState('');
  const [selectedTime, setSelectedTime] = useState('');
  const [showToast, setShowToast] = useState(false);
  const [toastMessage, setToastMessage] = useState('');

  const displayToast = (message) => {
    setToastMessage(message);
    setShowToast(true);
    setTimeout(() => {
      setShowToast(false);
    }, 3000);
  };

  const handleEnergySelect = (energy) => {
    setSelectedEnergy(energy);
    // Auto-advance to next step after selection
    setTimeout(() => {
      setCurrentStep(2);
    }, 500);
  };

  const handleBack = () => {
    if (currentStep > 1) {
      setCurrentStep(currentStep - 1);
    }
  };

  const handleClose = () => {
    displayToast('Returning to challenges...');
    // In real app, this would navigate back to challenges page
  };

  return (
    <div className="bg-gray-50 min-h-screen">
      <div className="max-w-sm mx-auto bg-white min-h-screen relative">
        
        {/* Toast Notification */}
        {showToast && (
          <div className="fixed top-4 left-1/2 transform -translate-x-1/2 bg-teal-500 text-white px-4 py-2 rounded-lg shadow-lg z-50">
            {toastMessage}
          </div>
        )}

        {/* Header */}
        <div className="flex items-center justify-between p-6 pt-8">
          <button 
            onClick={handleBack}
            className="text-gray-600 hover:text-gray-800 transition-colors"
            disabled={currentStep === 1}
          >
            <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 19l-7-7 7-7" />
            </svg>
          </button>
          
          <h2 className="text-xl font-bold text-gray-800">Create Challenge</h2>
          
          <button 
            onClick={handleClose}
            className="text-gray-600 hover:text-gray-800 transition-colors"
          >
            <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>
        </div>

        {/* Progress Indicator */}
        <ProgressIndicator currentStep={currentStep} totalSteps={3} />

        {/* Step Content */}
        <div className="px-6 pb-24">
          {currentStep === 1 && (
            <EnergySelection 
              selectedEnergy={selectedEnergy}
              onEnergySelect={handleEnergySelect}
            />
          )}
          
          {currentStep === 2 && (
            <div className="text-center py-20">
              <p className="text-gray-600">Time Selection - Coming Soon</p>
            </div>
          )}
          
          {currentStep === 3 && (
            <div className="text-center py-20">
              <p className="text-gray-600">Challenge Preview - Coming Soon</p>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}