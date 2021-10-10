const FollowToggle = require("./follow_toggle");

$( () => {
  let $buttonFollowToggles = $('button.follow-toggle');
  $buttonFollowToggles.each((index, el) => {
    new FollowToggle(el);
  });
});

