/*global module*/

var coffee = require('coffee-script'),
    lambdaCalculus = require('./../../lib/lambda.coffee'),
    helpers = require('./../../lib/helpers.coffee');

module.exports = function(chai, utils) {
  var Assertion = chai.Assertion;

  Assertion.addProperty('numerically', function() {
    utils.flag(this, 'numerically', true);
  });

  Assertion.addProperty('logically', function() {
    utils.flag(this, 'logically', true);
  });

  Assertion.addMethod('give', function(other) {
    var repr, expected, actual,  list;

    repr = this._obj.toString().replace(/\s+/g, ' ');

    if (utils.flag(this, 'logically')) {
      expected = other === lambdaCalculus.tru ? 'tru' : 'fls',
      actual = this._obj === lambdaCalculus.tru ? 'tru' : 'fls';

      this.assert(
        this._obj === other,
        'expected '+expected+' but got '+actual+' from '+repr,
        'expected '+expected+' to be '+actual,
        expected,
        actual
      );

    } else if ((list = utils.flag(this, 'listified'))) {

        var equal = list.length === other.length;

        for (var i = 0; i < list.length; i++) {
            if (list[i] !== other[i]) {
                equal = false;
            }
        }

        this.assert(
            equal,
            'expected #{exp} but got #{act} from #{this}',
            'expected #{exp} to be #{act}',
            other,
            list
        );

    } else {

      actual = helpers.toNum(this._obj);
      expected = helpers.toNum(other);

      this.assert(
        expected === actual,
        'expected #{exp} but got #{act} from ' + repr,
        'expected #{this} to be #{act}',
        expected,
        actual
      );

    }
  });

  Assertion.addProperty('as_a_list', function() {
      utils.flag(this, 'listified', this._obj(
          function(item) {
              return function(memo) {
                  memo.unshift(helpers.toNum(item));
                  return memo;
              };
          })([]));
  });
};
