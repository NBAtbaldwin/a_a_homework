const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


window.setTimeout(function() {
  alert('HAMMERTIME')
}, 3000)


function teaAndBiscuits() {
  let first, second;
  reader.question("Do you want tea? ", function(teaAnswer) {
    reader.question("Would you like biscuits? ", function(biscuitAnswer) {
      (teaAnswer.toLowerCase() == 'yes') ? first = "do" : first = "don't";
      (biscuitAnswer.toLowerCase() == 'yes') ? second = "do" : second = "don't";
      console.log(`So you ${first} want some tea, and you ${second} want some biscuits`);
      reader.close();
    });
  });
};














//b
