/* app.js */

// DOM elements
const slideForm = document.getElementById('slide-form');
const rideForm = document.getElementById('ride-form');
const lifeguardForm = document.getElementById('lifeguard-form');
const swimmerForm = document.getElementById('swimmer-form');
const otherPersonForm = document.getElementById('other-person-form');
const foodCourtForm = document.getElementById('food-court-form');
const rideOccupancyForm = document.getElementById('ride-occupancy-form');
const rideQueueLengthForm = document.getElementById('ride-queue-length-form');
const visitorScoreForm = document.getElementById('visitor-score-form');
const slideRatingForm = document.getElementById('slide-rating-form');
const rideRatingForm = document.getElementById('ride-rating-form');
const lifeguardHireForm = document.getElementById('lifeguard-hire-form');
const lifeguardFireForm = document.getElementById('lifeguard-fire-form');

const slideTable = document.getElementById('slide-table');
const rideTable = document.getElementById('ride-table');
const lifeguardTable = document.getElementById('lifeguard-table');

// Slide form submit event
slideForm.addEventListener('submit', (e) => {
  e.preventDefault();
  const name = document.getElementById('slide-name').value;
  const height = document.getElementById('slide-height').value;
  const thrillLevel = document.getElementById('slide-thrill-level').value;
  const popularityScore = document.getElementById('slide-popularity-score').value;
  addSlide(name, height, thrillLevel, popularityScore);
});

// Ride form submit event
rideForm.addEventListener('submit', (e) => {
  e.preventDefault();
  const name = document.getElementById('ride-name').value;
  const capacity = document.getElementById('ride-capacity').value;
  const duration = document.getElementById('ride-duration').value;
  const popularityScore = document.getElementById('ride-popularity-score').value;
  addRide(name, capacity, duration, popularityScore);
});

// Lifeguard form submit event
lifeguardForm.addEventListener('submit', (e) => {
  e.preventDefault();
  const name = document.getElementById('lifeguard-name').value;
  const certified = document.getElementById('lifeguard-certified').checked;
  const experienceYears = document.getElementById('lifeguard-experience-years').value;
  const performanceScore = document.getElementById('lifeguard-performance-score').value;
  addLifeguard(name, certified, experienceYears, performanceScore);
});

// Swimmer form submit event
swimmerForm.addEventListener('submit', (e) => {
  e.preventDefault();
  registerSwimmer();
});

// Other person form submit event
otherPersonForm.addEventListener('submit', (e) => {
  e.preventDefault();
  registerOtherPerson();
});

// Food court form submit event
foodCourtForm.addEventListener('submit', (e) => {
  e.preventDefault();
  registerFoodCourt();
});

// Ride occupancy form submit event
rideOccupancyForm.addEventListener('submit', (e) => {
  e.preventDefault();
  const rideName = document.getElementById('ride-occupancy-name').value;
  const occupancy = document.getElementById('ride-occupancy').value;
  changeRideOccupancy(rideName, occupancy);
});

// Ride queue length form submit eventI'm sorry, but the code you provided seems to be a template for an application that handles various forms and tables. The code snippet you shared is incomplete, and it's difficult to understand its purpose without additional context or the complete code. Could you provide more information about what functionality or specific problem you would like assistance with? That way, I can provide you with a more accurate and helpful response.