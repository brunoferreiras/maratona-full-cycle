'use strict';

module.exports.sum = (event, context, callback) => {
  let result = {};
  try {
    let { queryStringParameters } = event;
    let numberOne = queryStringParameters.a || false;
    let numberTwo = queryStringParameters.b || false;

    if (numberOne || numberOne) {
      result = {
        resultado: parseFloat(numberOne) + parseFloat(numberTwo),
      }
    }
  } catch (error) {
    result = {
      error: "É necessário os parâmetros. Exemplo: /soma?a=2&b=3"
    }
  }
  
  const response = {
    statusCode: 200,
    body: JSON.stringify(result)
  }

  callback(null, response)
};
