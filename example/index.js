WebAssembly.instantiateStreaming(
  fetch('example.wasm'),
  {}
).then((w) => {
  const exports = w.instance.exports;
  console.log(`The result of example(2, 3) is ${exports.example(2, 3)}.`);
});
