
Array.prototype.uniq = function() {
    let uniqueArray = [];
    for (let i = 0; i < this.length; i++) {
      if (!uniqueArray.includes(this[i])) {
        uniqueArray.push(this[i]);
      }
    }
    return uniqueArray;
  }
  
  Array.prototype.twoSum = function() {
    let pairs = [];
    for (let i = 0; i < this.length; i++) {
      for (let j = i + 1; j < this.length; j++) {
        if (this[i] + this[j] === 0) {
          pairs.push([i, j]);
        }
      }
    }
    return pairs;
  }
  
  Array.prototype.transpose = function() {
    let rows = this.length;
    let cols = this[0].length;
    let transposed = Array(cols).fill().map(() => Array(rows).fill());
    
    for (let i = 0; i < this.length; i++) {
      for (let j = 0; j < this[0].length; j++) {
        transposed[j][i] = this[i][j];
      }
    }
    return transposed;
  }
  
  