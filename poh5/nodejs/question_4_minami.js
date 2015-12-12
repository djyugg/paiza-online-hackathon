var readline = require('readline').createInterface(process.stdin, process.stdout);
var inputs = [];

function BombApplication(inputs) {
  var appProperties = inputs.splice(0, 1).toString().split(' ');

  this.lineNum = +appProperties[0];
  this.lineLength = +appProperties[1];
  this.lines = [];

  for (var i = 0; i < this.lineNum; i++) {
    this.lines.push([]);
  }

  while (inputs.length !== 0) {
    var lineSplit = inputs.splice(0, 1).toString().split(' ');

    this.lines.forEach(function (line, index) {
      line.push(lineSplit[index]);
    });
  }
}

BombApplication.prototype.doExplosion = function () {
  var lineLength = this.lineLength;

  var shiftBombs = function (line, current) {
    for (var tmpCurrent = current; tmpCurrent !== 0; tmpCurrent--) {
      line[tmpCurrent] = line[tmpCurrent - 1];
    }
    line[0] = 0;

    return line;
  };

  var explosion = function (line) {
    //先頭行の処理
    if (line[0] === '2') {
      line[0] = '0';
    }

    for (var current = 1; current < lineLength; current++) {
      if (line[current] === '2') {
        line = shiftBombs(line, current);
      }
    }

    return line;
  };

  this.lines = this.lines.map(function (line) {
    return explosion(line);
  });
};

BombApplication.prototype.outputLines = function () {
  var lastLineNum = this.lineNum - 1;

  for (var current = 0; current < this.lineLength; current++) {
    var output = '';

    this.lines.forEach(function (line, index) {
      output += line[current];

      if (index !== lastLineNum) {
        output += ' ';
      }
    });

    console.log(output);
  }
};


readline.on('line', function (line) {
  inputs.push(line);
});

readline.on('close', function () {
  readline.close();
  process.stdin.destroy();

  var bombApplication = new BombApplication(inputs);

  bombApplication.doExplosion();
  bombApplication.outputLines();
});
