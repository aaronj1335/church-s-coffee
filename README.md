i'm trying to learn some stuff about lambda calculus, and i understand things
better when i can hack on them. so this is a simple environment that allows you
to implement some of the core concepts in the lambda calculus (like church
numerals and data structures), and then quiz yourself by writing unit tests that
verify their correctness.

to test:

 - get [git](http://git-scm.com) and [node.js v0.8](http://nodejs.org)
 - run this:

        $ git clone https://github.com/aaronj1335/church-s-coffee.git
        $ cd church-s-coffee
        $ npm install
        $ npm test

if you'd like hack on the file and re-run the tests any time you change
something:

    $ node_modules/.bin/mocha --compilers coffee:coffee-script --watch
