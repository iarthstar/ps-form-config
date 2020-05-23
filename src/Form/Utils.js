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

exports._readFormConfig = () => Object.values(configOne);

exports._writeFormConfig = (a) => () => {
  const validConfig = Object.fromEntries(a.map(e => [e.name, e]));
  console.log(validConfig);
};