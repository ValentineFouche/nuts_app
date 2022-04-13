import "jquery-bar-rating";
import $ from 'jquery';

const initStarRating = () => {
  $('#recommendation_feedback_rating').barrating({
    theme: 'css-stars'
  });
  $('#restaurant_feedback_rating').barrating({
  $('#bookrecom_feedback_rating').barrating({
    theme: 'css-stars'
  });
  $('#podcastrecom_feedback_rating').barrating({
    theme: 'css-stars'
  });
};

export { initStarRating };
