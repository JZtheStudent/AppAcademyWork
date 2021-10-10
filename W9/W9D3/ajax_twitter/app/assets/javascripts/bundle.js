/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./frontend/api_util.js":
/*!******************************!*\
  !*** ./frontend/api_util.js ***!
  \******************************/
/***/ ((module) => {

const APIUtil = {
    followUser: id => {
        $ajax({
            method: 'POST',
            url: `/users/${id}/follow`,
            success: () => {
                that.followState = "following"
            },
            dataType: 'json'
        });
    },

    unfollowUser: id => {
        $ajax({
            method: 'DELETE',
            url: `/users/${id}/follow`,
            dataType: 'json'
        });
    }
};

module.exports = APIUtil;


/***/ }),

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

const APIUtil = __webpack_require__(/*! ./api_util.js */ "./frontend/api_util.js");

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

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
var __webpack_exports__ = {};
// This entry need to be wrapped in an IIFE because it need to be isolated against other modules in the chunk.
(() => {
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
const FollowToggle = __webpack_require__(/*! ./follow_toggle */ "./frontend/follow_toggle.js");

$( () => {
  let $buttonFollowToggles = $('button.follow-toggle');
  $buttonFollowToggles.each((index, el) => {
    new FollowToggle(el);
  });
});


})();

/******/ })()
;
//# sourceMappingURL=bundle.js.map