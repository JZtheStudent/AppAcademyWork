function range(start, end) {
    if (start === end) return [start];

    return [start].concat(range(start + 1, end));
}

// console.log(range(2,7));
// console.log(range(2,8));
// console.log(range(2,20));
// console.log(range(1,5));


function sumRec(arr) {
    if (arr.length === 1) return arr[0];
    return arr[0] + sumRec(arr.slice(1));
}

// console.log(sumRec([1,2,3, 4]));


function exponent(base, exp) {
    if (exp === 0) return 1;

    return base * exponent(base, exp -1);
}

// console.log(exponent(2, 3))
// console.log(exponent(2, 0))


function fibonacci(n) {
    if (n == 1) return [1]
    if (n == 2) return [1, 1]
    let prev = fibonacci(n - 1)
    let nextNum = prev[prev.length - 1] + prev[prev.length - 2]
    prev.push(nextNum)
    return prev
}

function deepDup(arr) {
    let deepDuplicates = [];
    arr.forEach((ele) => {
        if (!Array.isArray(ele)) {
            deepDuplicates.push(ele);
        } else {
            deepDuplicates.push(deepDup(ele));
        }
    });
    return deepDuplicates;
}

