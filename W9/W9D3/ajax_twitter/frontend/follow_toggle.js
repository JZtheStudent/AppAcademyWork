const APIUtil = require("./api_util.js");

class FollowToggle {

  constructor(el) {
    this.userId = el.dataset.userId;
    this.followState = el.dataset.initialFollowState;
    this.el = $(el);
    this.el.click(this.handleClick);
    this.render();
  }

  render() {
    // console.log(this.el.prop("disabled"));
    // debugger;
    if (this.followState === "unfollowed") {
      this.el.prop("disabled", false);
      // console.log(this.el.prop("disabled"));
      this.el.html("Follow");
    } else if (this.followState === "followed") {
      this.el.prop("disabled", false);
      // console.log(this.el.prop("disabled"));

      this.el.html("Unfollow");
    } else {
      this.el.prop("disabled", true);
      // console.log(this.el.prop("disabled"));

    }
  }

  handleClick(e) {
    e.preventDefault();
    console.log("hello there");
    debugger;
    const that = this;
    if (this.followState === "unfollowed") {
      this.followState = "following";
      this.render();
      APIUtil.followUser(this.userId).then( () => { 
        that.followState = "followed";
        that.render();
      });
    } else {
      this.followState = "unfollowing";
      this.render();
      APIUtil.unfollowUser(this.userId).then( () => {
        that.followState = "unfollowed";
        that.render();
      });
    }
  }
}

module.exports = FollowToggle;