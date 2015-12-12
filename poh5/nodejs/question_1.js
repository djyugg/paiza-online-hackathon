process.stdin.resume();
process.stdin.setEncoding('utf8');

process.stdin.on('data', function (chunk) {

  var displayCharacters = Array.prototype.filter.call(chunk, function (s, i) {
    return (i % 2) === 0;
  });

  console.log(displayCharacters.join().replace(/,/g, ""));
});
