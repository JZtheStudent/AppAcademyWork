Array.prototype.myEach = function(func) {
    this.forEach(el => func(el));
}
let print = function(el) {
    console.log(el);
}


Array.prototype.myMap = function(callback) {
    let mapped = [];
    for (let i = 0; i < this.length; ++i) {
        mapped.push(callback(this[i]));
    }
    return mapped;
}

let addOne = function(num) {
    return num + 1;
}

Array.prototype.myReduce = function (func, initialValue=null) {

    let idx = 0;

    if (!initialValue) {
        initialValue = this[0];
        idx = 1;
    }
    res = initialValue;
    for (i = idx; i < this.length; ++i) {
        res = func(res, this[i]);
    }
    return res;
}

let inject = function(acc, el) {
    return acc + el;
}