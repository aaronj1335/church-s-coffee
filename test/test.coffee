require "coffee-script"
require("./helpers/globalize")(require "./../lib/lambda.coffee")
chai = require "chai"
lambdaComparisons = require "./helpers/lambda"
chai.use lambdaComparisons
chai.should()


describe "boolean operators", ()->

  describe "test", ()->
    it "should select the first value when passed tru", ()->
      test(tru)(tru)(fls).should.logically.give tru
    it "should select the second value when passed fls", ()->
      test(fls)(tru)(fls).should.logically.give fls

  describe "not", ()->
    it "should return false correctly", ()->
      notl(tru).should.logically.give fls
    it "should return true correctly", ()->
      notl(fls).should.logically.give tru

  describe "and", ()->
    it "should return true correctly", ()->
      andl(tru)(tru).should.logically.give tru
    it "should return false correctly", ()->
      andl(tru)(fls).should.logically.give fls
      andl(fls)(tru).should.logically.give fls
      andl(fls)(fls).should.logically.give fls

  describe "or", ()->
    it "should return true correctly", ()->
      orl(tru)(tru).should.logically.give tru
      orl(tru)(fls).should.logically.give tru
      orl(fls)(tru).should.logically.give tru
    it "should return false correctly", ()->
      orl(fls)(fls).should.logically.give fls

  describe "xor", ()->
    it "should return true correctly", ()->
      xorl(tru)(fls).should.logically.give tru
      xorl(fls)(tru).should.logically.give tru
    it "should return false correctly", ()->
      xorl(tru)(tru).should.logically.give fls
      xorl(fls)(fls).should.logically.give fls

  describe "xnor", ()->
    it "should return true correctly", ()->
      xnorl(tru)(tru).should.logically.give tru
      xnorl(fls)(fls).should.logically.give tru
    it "should return false correctly", ()->
      xnorl(tru)(fls).should.logically.give fls
      xnorl(fls)(tru).should.logically.give fls


describe "pairs", ()->

  describe "fst", ()->
    it "should return the first value", ()->
      fst(pair(tru)(fls)).should.logically.give tru
      fst(pair(tru)(fls)).should.not.logically.give fls

  describe "snd", ()->
    it "should return the second value", ()->
      snd(pair(tru)(fls)).should.logically.give fls
      snd(pair(tru)(fls)).should.not.logically.give tru


describe "numbers", ()->

  describe "one", ()-> it "should equal itself", ()->
      one.should.give one

  describe "four", ()->
    it "should equal itself", ()->
      four.should.give 4

  describe "succ", ()->
    it "should give one as the successor to zero", ()->
      (succ zero).should.give one
    it "should give four as the successor of the successor of two", ()->
      succ(succ two).should.give four
    it "should give 11 as the successor ten", ()->
      (succ ten).should.give 11

  describe "pred", ()->
    it "should give three as the predecessor of four", ()->
      pred(four).should.give three
    it "should give zero as the predecessor of zero", ()->
      pred(zero).should.give zero

  describe "iszero", ()->
    it "correctly distinguishes zero", ()->
      iszero(zero).should.logically.give tru
    it "correctly distinguishes one", ()->
      iszero(one).should.logically.give fls
    it "correctly distinguishes ten", ()->
      iszero(ten).should.logically.give fls

  describe "equal", ()->
    it "indicates that three and three are equal", ()->
      equal(three)(three).should.logically.give tru
    it "indicates that three and seven are not equal", ()->
      equal(three)(seven).should.logically.give fls
    it "indicates that zero and seven are not equal", ()->
      equal(zero)(seven).should.logically.give fls
    it "indicates that seven and zero are not equal", ()->
      equal(seven)(zero).should.logically.give fls
    it "indicates that zero and zero are equal", ()->
      equal(zero)(zero).should.logically.give tru


describe "numeric operators", ()->

  describe "plus", ()->
    it "should sum two and six to eight", ()->
      plus(two)(six).should.give eight
    it "should sum zero and nine to nine", ()->
      plus(zero)(nine).should.give nine

  describe "times", ()->
    it "should multiply two and four and get eight", ()->
      times(two)(four).should.give eight
    it "should multiply one and three and get three", ()->
      times(one)(three).should.give three
    it "should multiply zero and seven and get zero", ()->
      times(zero)(seven).should.give zero

  describe "pow", ()->
    it "should square three and give nine", ()->
      pow(three)(two).should.give nine
    it "raises five to the power of seven and gives 78125", ()->
      pow(five)(seven).should.give 78125

  describe "minus", ()->
    it "should subtract two from five and get three", ()->
      minus(five)(two).should.give three
    it "should subtract seven from nine and get 2", ()->
      minus(nine)(seven).should.give 2


