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
  // I will need to ///concatenate or merge 2 arrays/// use a spread operator ... so that I don't change the existing array and I return NEW array
  // for this we also need to create a 'SET' for the right array so that we can iterate over it with unique values
  let element = [...new Set(right)]
  // I am going to need to create a counting or GetFrequency HELPER function
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
  // Note we do not need to return result[0];...we can just return result
  return result[0];

}

// for this we are counting the amount of times x === item in the length of the array
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter
const getFrequency = (arr, item) => {
  return arr.filter(x => x === item).length;
}




function uncover_spy(n, trust) {
    // first we need to make an array that keeps track of the trust count
    // we will fill all of its indeces with the inital count of 0
    
    // we can use a trust count array with a length that's 1 more than our total number of people to 
    // make it easier to map each person to the proper index in the array

    // if we used a trust count array with the same length as the number of people then it gets messy bc person 2 would map to index 1 ...etc 
    // so the first person in the tructCOunt array doesn't really play any role in this

    
    let trustCounts = new Array(n + 1).fill(0);
    
    // now we have to loop over the "Trust" pairs and update our trust count
    for (let [i, j] of trust) {
        // remember we have to decrement the trust count of the person that is trusting
        // and increment the trust count of the person being trusted
        trustCounts[i] -=1;
        trustCounts[j] +=1;
    }
    // so REMEMBER the first person in the tructCOunt array doesn't really play any role in this
    // so we can start this next loop at index 1 
    for (let i = 1; i < trustCounts.length; i++) {
        // we are looking for the index if there is any that equals n-1 (total  number of people - 1)
        if (trustCounts[i] === n - 1){
            // then we return i becasue then we found our spy
            return i;
        }
    }
    // if these requirements are not met then we simply return -1
    return -1;
    
};

// THink of this as a zero sum game
// anytime someone trusts someone.... the person that is doing the trusting loses 1 point in trust count
// the person that is trusted gains 1 point
// so we have to keep track of our counts for each person
// we can do this with an array whos indeces represent each person
// we can use a trust count array with a length that's 1 more than our total number of people to make it easier to map
//... each person to the proper index in the array

// if we used a trust count array with the same length as the number of people then it gets messy bc person 2 would map to index 1 ...etc 



