// Write a function, `shuffledSentenceDetector(sentence1, sentence2)`, that
// returns true if the words in `sentence1` can be rearranged to form
// `sentence2`.
function shuffledSentenceDetector(sentence1, sentence2) {
  let words = {};
  sentence1.split(" ").forEach(word => {
    if (! (word in words)) {
      words[word] = 1;
    } else {
      words[word]++;
    }
  });
  sentence2.split(" ").forEach(word => {
    if (! (word in words)) {
      return false;
    } else {
      words[word]--;
      if (words[word] < 0) return false;
    }
  });
  
  return Object.values(words).every(count => count === 0);
}


// Write an `Array.prototype.myEach(callback)` method that invokes a callback
// for every element in an array and returns undefined. 
//
// **Do NOT use the built-in `Array.prototype.forEach` method in your 
// implementation.**
Array.prototype.myEach = function(callback) {
  for (let i = 0; i < this.length; ++i) {
    callback(this[i]);
  }
}

// Write an `Array.prototype.myFilter(callback)` that takes a callback and
// returns a new array which includes every element for which the callback 
// returned true. Use the `Array.prototype.myEach` method you defined above. 
//
// **Do NOT use the built-in `Array.prototype.filter` or 
// `Array.prototype.forEach` methods in your implementation.**
Array.prototype.myFilter = function(callback) {
  let result = [];
  this.myEach(el => {
    if (callback(el)) result.push(el);
  });
  return result;
}

// Write a function `pairMatch(array, callback)`. It should return all pairs
// of indices ([i, j]) for which `callback(array[i], array[j])` returns true.
//
// NB: Keep in mind that the order of the arguments to the callback may matter.
// e.g., callback = function(a, b) { return a < b }
function pairMatch(array, callback) {
  let result = [];
  for (let i = 0; i < array.length; ++i) {
    for (let j = 0; j < array.length && j !== i; ++j) {
      if (callback(array[i], array[j])) {
        result.push([i, j]);
      }
      if (callback(array[j], array[i])) {
        result.push([j, i]);
      }
    }
  }
  return result.sort();
}


// Write an `Array.prototype.mergeSort` method that merge sorts an array. It 
// should take an optional callback that compares two elements, returning -1 if 
// the first element should appear before the second, 0 if they are equal, and 1 
// if the first element should appear after the second. Define and use a helper 
// method, `merge(left, right, comparator)`, to merge the halves. Make sure that 
// `merge` is defined on the window. 
//
// **Do NOT call the built-in `Array.prototype.sort` or `Array.prototype.sort_by`
// methods in your implementation.**
//
// Here's a summary of the merge sort algorithm:
//
// Split the array into left and right halves, then merge sort them recursively
// until a base case is reached. Use a helper method, merge, to combine the
// halves in sorted order, and return the merged array.
Array.prototype.mergeSort = function(callback) {
  if (this.length <= 1) return this;
  if (!callback) {
    callback = function(left, right) {
      return left < right ? -1 : left > right ? 1 : 0;
    }
  }
  let mid = Math.floor(this.length / 2);
  let left = this.slice(0, mid).mergeSort(callback);
  let right = this.slice(mid).mergeSort(callback);
  return merge(left, right, callback);
}

function merge(left, right, callback) {
  let merged = [];
  while (left.length && right.length) {
    if (callback(left[0], right[0]) === -1) {
      merged.push(left.shift());
    } else {
      merged.push(right.shift());
    }
  }
  return merged.concat(left, right);
}

// Write a `Function.prototype.myBind(context)` method. It should return a copy
// of the original function, where `this` is set to `context`. It should allow 
// arguments to the function to be passed both at bind-time and call-time.
Function.prototype.myBind = function(context, ...bindArgs) {
  let that = this;
  return function(...callArgs) {
    return that.apply(context, bindArgs.concat(callArgs));
  }
}

// Write a `Function.prototype.inherits(ParentClass)` method. It should extend
// the methods of `ParentClass.prototype` to `ChildClass.prototype`.
//
// **Do NOT use `Object.create`, `Object.assign`, `Object.setPrototypeOf`, or 
// modify the `__proto__` property of any object directly.**
Function.prototype.inherits = function(ParentClass) {
  function Surrogate () {};
  Surrogate.prototype = ParentClass.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
}

// Write a function `myCurry(fn, object, numArgs)`, that curries the function.
// Remember that a curried function is invoked with one argument at a time. For
// example, the curried form of `sum(1, 2, 3)` would be written as
// `curriedSum(1)(2)(3)`. After `numArgs` have been passed in, invoke the
// original `fn` with the accumulated arguments, using `object` as the
// context.

function myCurry(fn, object, numArgs) {
  let args = [];
  let that = object;
  let func = fn;
  return function _myCurry(arg) {
    args.push(arg);
    if (args.length === numArgs) {
      return func.apply(that, args);
    } else {
      return _myCurry;
    }
  }
}