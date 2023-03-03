module.exports = [
    {
        type: 'input',
        name: 'name',
        default: "users",
        message: "What is the route name ?"
    },
    {
        type: 'input',
        name: 'endpoint',
        default: "login",
        message: "What is the endpoint ?"
    },
    {
        type: 'confirm',
        name: 'dynamic',
        default: true,
        message: "Do you want dynamic route as well ?"
    },
]
