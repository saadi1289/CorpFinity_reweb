import React, { useState } from 'react';

export default function WellnessApp() {
  const [showToast, setShowToast] = useState(false);
  const [toastMessage, setToastMessage] = useState('');

  const displayToast = (message) => {
    setToastMessage(message);
    setShowToast(true);
    setTimeout(() => {
      setShowToast(false);
    }, 3000);
  };

  const openWizard = () => {
    displayToast('Challenge wizard coming soon! 🚀');
  };

  const joinChallenge = (challengeId) => {
    displayToast(`Starting ${challengeId} session! 🎯`);
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

        {/* Challenges Screen */}
        <div className="pb-24">
          {/* Header */}
          <div className="flex items-center justify-between p-6 pt-8">
            <h2 className="text-2xl font-bold text-gray-800">Challenges</h2>
            <button 
              onClick={openWizard}
              className="bg-teal-500 text-white px-4 py-2 rounded-xl text-sm font-medium hover:bg-teal-600 transition-colors"
            >
              + New
            </button>
          </div>

          {/* Ongoing Progress */}
          <div className="px-6 mb-6">
            <h3 className="text-base font-semibold text-gray-800 mb-3">Ongoing Progress</h3>
            <div className="space-y-3">
              <div className="bg-white rounded-2xl p-4 shadow-sm border-2 border-teal-500">
                <div className="flex items-center justify-between mb-3">
                  <div>
                    <h4 className="font-semibold text-gray-800">5-Minute Energy Boost</h4>
                    <p className="text-sm text-gray-500">Session 2 of 3 • Breathing & stretching</p>
                  </div>
                  <div className="text-right">
                    <p className="text-sm font-medium text-teal-500">67%</p>
                    <p className="text-xs text-gray-500">1 session left</p>
                  </div>
                </div>
                <div className="w-full bg-gray-200 rounded-full h-2 mb-2">
                  <div className="bg-teal-500 h-2 rounded-full" style={{width: '67%'}}></div>
                </div>
                <p className="text-xs text-gray-600">Next: Deep breathing exercises • 5 minutes</p>
              </div>
              
              <div className="bg-white rounded-2xl p-4 shadow-sm border border-gray-100">
                <div className="flex items-center justify-between mb-3">
                  <div>
                    <h4 className="font-semibold text-gray-800">10-Minute Calm Focus</h4>
                    <p className="text-sm text-gray-500">Session 1 of 2 • Meditation & mindfulness</p>
                  </div>
                  <div className="text-right">
                    <p className="text-sm font-medium text-gray-600">50%</p>
                    <p className="text-xs text-gray-500">1 session left</p>
                  </div>
                </div>
                <div className="w-full bg-gray-200 rounded-full h-2 mb-2">
                  <div className="bg-purple-300 h-2 rounded-full" style={{width: '50%'}}></div>
                </div>
                <p className="text-xs text-gray-600">Next: Guided meditation • 10 minutes</p>
              </div>

              <div className="bg-white rounded-2xl p-4 shadow-sm border border-gray-100">
                <div className="flex items-center justify-between mb-3">
                  <div>
                    <h4 className="font-semibold text-gray-800">30-Minute Wellness Break</h4>
                    <p className="text-sm text-gray-500">Session 3 of 5 • Full body & mind reset</p>
                  </div>
                  <div className="text-right">
                    <p className="text-sm font-medium text-gray-600">60%</p>
                    <p className="text-xs text-gray-500">2 sessions left</p>
                  </div>
                </div>
                <div className="w-full bg-gray-200 rounded-full h-2 mb-2">
                  <div className="bg-green-300 h-2 rounded-full" style={{width: '60%'}}></div>
                </div>
                <p className="text-xs text-gray-600">Next: Yoga flow & relaxation • 30 minutes</p>
              </div>
            </div>
          </div>

          {/* Recently Completed */}
          <div className="px-6 mb-6">
            <h3 className="text-base font-semibold text-gray-800 mb-3">Recently Completed</h3>
            <div className="space-y-3">
              <div className="bg-white rounded-2xl p-4 shadow-sm border border-gray-100">
                <div className="flex items-center justify-between">
                  <div>
                    <h4 className="font-semibold text-gray-800">5-Minute Morning Energizer</h4>
                    <p className="text-sm text-gray-500">Quick energy session • Completed 2 hours ago</p>
                  </div>
                  <div className="text-right">
                    <div className="text-2xl mb-1">🏆</div>
                    <p className="text-xs text-teal-500 font-medium">+25 pts</p>
                  </div>
                </div>
              </div>
              
              <div className="bg-white rounded-2xl p-4 shadow-sm border border-gray-100">
                <div className="flex items-center justify-between">
                  <div>
                    <h4 className="font-semibold text-gray-800">10-Minute Desk Relief</h4>
                    <p className="text-sm text-gray-500">Stretching session • Completed yesterday</p>
                  </div>
                  <div className="text-right">
                    <div className="text-2xl mb-1">⭐</div>
                    <p className="text-xs text-teal-500 font-medium">+50 pts</p>
                  </div>
                </div>
              </div>

              <div className="bg-white rounded-2xl p-4 shadow-sm border border-gray-100">
                <div className="flex items-center justify-between">
                  <div>
                    <h4 className="font-semibold text-gray-800">15-Minute Stress Buster</h4>
                    <p className="text-sm text-gray-500">Relaxation session • Completed 2 days ago</p>
                  </div>
                  <div className="text-right">
                    <div className="text-2xl mb-1">🧘</div>
                    <p className="text-xs text-teal-500 font-medium">+75 pts</p>
                  </div>
                </div>
              </div>
            </div>
          </div>

          {/* Popular Challenges */}
          <div className="px-6 mb-6">
            <h3 className="text-base font-semibold text-gray-800 mb-3">Popular Challenges</h3>
            <div className="space-y-3">
              <div className="bg-white rounded-2xl p-4 shadow-sm border border-gray-100">
                <div className="flex items-center justify-between mb-3">
                  <div className="flex-1">
                    <h4 className="font-semibold text-gray-800">Quick Energy Boost</h4>
                    <p className="text-sm text-gray-500">5-minute sessions to increase energy</p>
                    <div className="flex items-center space-x-4 mt-2">
                      <span className="text-xs bg-teal-50 text-teal-500 px-2 py-1 rounded-full">5 minutes</span>
                      <span className="text-xs text-gray-500">⭐ 4.8 rating</span>
                      <span className="text-xs text-gray-500">1.2k completed</span>
                    </div>
                  </div>
                  <button 
                    onClick={() => joinChallenge('energy-boost')}
                    className="bg-teal-500 text-white px-4 py-2 rounded-xl text-sm font-medium hover:bg-teal-600 transition-colors ml-2"
                  >
                    Start
                  </button>
                </div>
              </div>

              <div className="bg-white rounded-2xl p-4 shadow-sm border border-gray-100">
                <div className="flex items-center justify-between mb-3">
                  <div className="flex-1">
                    <h4 className="font-semibold text-gray-800">Stress Relief Sessions</h4>
                    <p className="text-sm text-gray-500">10-minute guided stress reduction</p>
                    <div className="flex items-center space-x-4 mt-2">
                      <span className="text-xs bg-red-50 text-red-400 px-2 py-1 rounded-full">10 minutes</span>
                      <span className="text-xs text-gray-500">⭐ 4.9 rating</span>
                      <span className="text-xs text-gray-500">856 completed</span>
                    </div>
                  </div>
                  <button 
                    onClick={() => joinChallenge('stress-relief')}
                    className="bg-teal-500 text-white px-4 py-2 rounded-xl text-sm font-medium hover:bg-teal-600 transition-colors ml-2"
                  >
                    Start
                  </button>
                </div>
              </div>

              <div className="bg-white rounded-2xl p-4 shadow-sm border border-gray-100">
                <div className="flex items-center justify-between mb-3">
                  <div className="flex-1">
                    <h4 className="font-semibold text-gray-800">Focus & Clarity</h4>
                    <p className="text-sm text-gray-500">15-minute concentration enhancement</p>
                    <div className="flex items-center space-x-4 mt-2">
                      <span className="text-xs bg-purple-50 text-purple-400 px-2 py-1 rounded-full">15 minutes</span>
                      <span className="text-xs text-gray-500">⭐ 4.7 rating</span>
                      <span className="text-xs text-gray-500">2.1k completed</span>
                    </div>
                  </div>
                  <button 
                    onClick={() => joinChallenge('focus-clarity')}
                    className="bg-teal-500 text-white px-4 py-2 rounded-xl text-sm font-medium hover:bg-teal-600 transition-colors ml-2"
                  >
                    Start
                  </button>
                </div>
              </div>

              <div className="bg-white rounded-2xl p-4 shadow-sm border border-gray-100">
                <div className="flex items-center justify-between mb-3">
                  <div className="flex-1">
                    <h4 className="font-semibold text-gray-800">Mood Lifter</h4>
                    <p className="text-sm text-gray-500">20-minute sessions for better mood</p>
                    <div className="flex items-center space-x-4 mt-2">
                      <span className="text-xs bg-green-50 text-green-400 px-2 py-1 rounded-full">20 minutes</span>
                      <span className="text-xs text-gray-500">⭐ 4.6 rating</span>
                      <span className="text-xs text-gray-500">634 completed</span>
                    </div>
                  </div>
                  <button 
                    onClick={() => joinChallenge('mood-lifter')}
                    className="bg-teal-500 text-white px-4 py-2 rounded-xl text-sm font-medium hover:bg-teal-600 transition-colors ml-2"
                  >
                    Start
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}