const dataModelName = {
  type: 'input',
  name: 'model',
  message: "Write consumable model name"
};

const nestedModule = {
  type: 'input',
  name: 'args',
  message: "Write args in method:model:state in comma separated values",
  result: (data) => {
    return data.split(',').map((v) => {
      const split = v.split(':');
      return {
        module: split[0],
        model: split[1],
        state: split[2],
      };
    });
  }
};

const screenName = {
  type: 'input',
  name: 'screen',
  message: "Enter the screen name!",
};

module.exports = { dataModelName, nestedModule, screenName };