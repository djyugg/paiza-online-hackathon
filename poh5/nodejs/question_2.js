var readline = require('readline').createInterface(process.stdin, process.stdout);

var inputs = [];
var ONE_WEEK_DAYS = 7;

readline.on('line', function (line) {
  inputs.push(+line);
});

var createWeekInput = function (inputs) {
  var result = [];

  for (var i = 0; i < ONE_WEEK_DAYS; i++) {
    result.push(+inputs.splice(0, 1));
  }

  return result;
};

var createWeeksInput = function (weeks, inputs) {
  var result = [];

  for (var i = 0; i < weeks; i++) {
    result.push(createWeekInput(inputs));
  }

  return result;
};

readline.on('close', function () {
  readline.close();
  process.stdin.destroy();

  var days = inputs.splice(0, 1);
  var weeks = days / ONE_WEEK_DAYS;
  var weeksInput = createWeeksInput(weeks, inputs);

  var results = weeksInput.reduce(function (week1, week2) {
    return week1.map(function (day, index) {
      return day + week2[index];
    });
  });

  results.forEach(function(result){
    console.log(result);
  });
});
