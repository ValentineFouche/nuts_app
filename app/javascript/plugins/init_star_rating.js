import "jquery-bar-rating";
import $ from 'jquery';

const initStarRating = () => {
  $('#recommendation_feedback_rating').barrating({
    theme: 'css-stars'
  });
};

export { initStarRating };