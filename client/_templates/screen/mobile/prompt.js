// see types of prompts:
// https://github.com/enquirer/enquirer/tree/master/examples
//
module.exports = [
  {
    type: 'confirm',
    name: 'formData',
    default: false,
    message: "Do you want Dev data for forms with new screen ?"
  },
  {
    type: 'input',
    name: 'widgets',
    message: "Write the name of widgets in comma separated values.",
    result: (data) => {
      if (!data) return []; 
      const parsed = data.split(',');
      return parsed;
    }
  }
]
