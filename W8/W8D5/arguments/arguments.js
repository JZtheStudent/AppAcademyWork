
function sum(...args) {
  let sum = 0;
  args.forEach(el => {
    sum += el;
  })
  return sum;
};

Function.prototype.myBind = function(ctx, ...bindArgs) {
  let that = this;
  return function(...callArgs) {
    let args = bindArgs.concat(callArgs);
    return that.apply(ctx, args);
  };
};

function curriedSum(numArgs) {
  const numbers = [];
  return function _curriedSum(num) {
    numbers.push(num);
    if (numbers.length === numArgs) {
      return numbers.reduce((acc, el) => acc + el);
    } else {
      return _curriedSum;
    };
  };
};

Function.prototype.curry = function(numArgs) {
  const args = [];
  let that = this;
  return function _curry(arg) {
    args.push(arg);
    if (args.length === numArgs) {
      that(...args);
    } else {
      return _curry;
    }
  } 
};
