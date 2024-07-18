const fs = require('node:fs');

const wasmBuffer = fs.readFileSync('example.wasm');
WebAssembly.instantiate(wasmBuffer).then(w => {
  console.log(`The result of example(2, 3) is ${w.instance.exports.example(2, 3)}.`);
});
