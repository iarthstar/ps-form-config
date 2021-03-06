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

exports._readFormConfig = (a) => Object.values(a);

exports._writeFormConfig = (a) => Object.fromEntries(
  a.map(field => {
    field.contents.__KIND__ = field.tag;
    return field.contents;
  }).map(e => [e.name, e])
);
