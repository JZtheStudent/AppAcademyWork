
const readline = require("readline");
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


function askIfGreaterThan(el1, el2, callback) {
  reader.question(`Is ${el1} > ${el2}?\n`, response => {
    (response === "yes") ? callback(true) : callback(false);
  })
}

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  if (i < arr.length - 1) {
    madeAnySwaps = false;
    askIfGreaterThan(arr[i], arr[i + 1], (isGreaterThan) => {
      if (isGreaterThan) {
        [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]];
        madeAnySwaps = true;
      }
      innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
    });
    
  } else {
    outerBubbleSortLoop(madeAnySwaps);
  }
}

function absurdBubbleSort(arr, sortCompletionCallback) {
  
  outerBubbleSortLoop(true);

  function outerBubbleSortLoop(madeAnySwaps) {
    if (madeAnySwaps) {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    } else {
      sortCompletionCallback(arr);
    }
  }

}

arr1 = [3, 2, 1];
absurdBubbleSort(arr1, (arr) => {
  console.log(arr);
  reader.close();
});


// innerBubbleSortLoop([3, 2, 3], 0, false, (val) => {
//   console.log('in outer sort');
//   reader.close();
// })


// askIfGreaterThan(1, 5, (val) => {
//   console.log(val)
//   reader.close();
// });