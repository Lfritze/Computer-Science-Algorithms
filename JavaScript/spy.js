// n is the number of value (1 through n)
// if the 2nd VALUE is always the 2nd ITEM in the array and never the 1st ... then this is potentially the spy
// the 1st item in the array is the truster of the 2nd item
// so basically if any value is ever the first element in the array...it can never be the spy
// if the values flip-flop and there is no spy , then we return -1

function uncover_spy(n, trust) {
  // we need to account for edge case where the city-state of n only equals 1 (n=1) and the trust array is empty
  if (n == 1 && trust.length == 0) {
    return 1;
  }
  // let's make 2 arrays for the left and right values - to push items into so we can compare values
  let left = [];
  let right = [];
  // let's iterate over the trust array and push values into 'left array' starting at index 0  and index 1 for right array
  for (const t of trust ) {
    left.push(t[0]);
    right.push(t[1]);
  }
  // now we need to make a new instance of the array for the right - we can use the 'NEW' operator for this
  // I will need to concatenate or merge 2 arrays with a spread operator ... so that I don't change the existing array and I return NEW array
  // for this we also need to create a 'SET' for the right array so that we can iterate over it
  let element = [...new Set(right)]
  // I am going to need to create a counting or GetFrequency function
  // I will also need a "SPY" array to push 'element' into
  let newArr = [];
  // now I need to iterate over 'element'
  for (const e of element) {
    // if the frequency of e in right == n - 1
    // the total number of people - 1
    // for example if n = 5 and the frequency of e in the right array is 4
    if (getFrequency(right, e) == n - 1) {
      
      // then we push e into newArr - push adds to the end of the array
      newArr.push(e)
    }
  }
  // to get the result we need to filter newArr
  // we can use the indexOf() method - because it represents a position where the specified search value occurs for the first time
  // it also returns -1 if the character never occurs again
  // So what we are doing is removing duplicates...so if any values in the left array match the values in the right array... we remove them from the right array
  let result = newArr.filter(x => left.indexOf(x) == -1);
  // Now check if result.length equals 0 , the we know that their is no spy because the values are duplicated in both arrays
  if(result.length == 0) {
    return -1
  }
  // then we can return our result
  // Note we do not neet to return result[0];...we can just return result
  return result[0];

}

// for this we are counting the amount of times x === item in the length of the array
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter
const getFrequency = (arr, item) => {
  return arr.filter(x => x === item).length;
}


// Terrible Whiteboard Notes

// total number of people minus 1 equals the spy's trust count
// we can think of this as a zero sum game


















// we need to account for edge case where the city-state of n only equals 1 (n=1)

// function uncover_spy(n, trust) {
// if (n == 1 && trust.length == 0) return 1;
// let left = [];
// let right = [];
// for (const t of trust) {
// left.push(t[0]);
// right.push(t[1]);
// }
// let element = [...new Set(right)];
// let bobo = [];
// for (const e of element) {
// if (getFrequency(right, e) == n - 1) {
// bobo.push(e);
// }
// }
// let res = bobo.filter(bob => left.indexOf(bob) == -1);
// if (res.length == 0) return -1;
// return res[0];
// };
// const getFrequency = (arr, item) => {
// return arr.filter(x => x === item).length;
// };