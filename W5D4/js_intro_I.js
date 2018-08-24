function madLib(verb, adj, noun) {
  return `We shall ${verb} the ${adj} ${noun}`
}

// console.log(madLib('make', 'best', 'guac'))

function isSubstring(searchString, subString) {
  return searchString.includes(subString)
}

// console.log(isSubstring('tyler', 'ler'))
function fizzbuzz(array) {
  let magicArray = [];
  for (let i = 0; i < array.length; i++) {
    if ((array[i]%3 === 0 || array[i]%5 === 0) && (array[i]%15 !== 0)) {
      magicArray.push(array[i])
    }
  }
  return magicArray
}

// console.log(fizzbuzz([6, 10, 15]))

function isPrime(num) {
  if (num == 0 || num == 1) {
    return false
  };
  for (let i = 2; i < num; i++) {
    if (num%i == 0 && num !== i) {
      return false
    };
  }
  return true
}

// console.log(isPrime(30))
// console.log(isPrime(37))

function firstNPrimes(n) {
  let primeArr = [];
  let i = 2
  while (primeArr.length < n) {
    isPrime(i) ? primeArr.push(i) : 1;
    i++
  };
  return primeArr
}

function sumOfNPrimes(n) {
  const arr = firstNPrimes(n)
  sum = 0
  for (let i = 0; i < arr.length; i++) {
    sum += arr[i]
  };
  return sum
}

// console.log(sumOfNPrimes(4))








// /
