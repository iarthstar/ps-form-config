const PS = require('../dist/index_bundle.js');

const configOne = {
  firstname: {
    kind: "TEXTFIELD",
    name: "firstname",
    required: true
  },
  lastname: {
    kind: "TEXTFIELD",
    name: "lastname",
    required: true
  },
  gender: {
    kind: "SELECT",
    name: "gender",
    required: true,
    options: [
      { label: "Male", value: "male" },
      { label: "Female", value: "female" }
    ]
  }
};

console.log(PS['Main'].validateConfig(configOne));