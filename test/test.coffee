require "coffee-script"
require("./helpers/globalize")(require "./../lib/lambda.coffee")
chai = require "chai"
lambdaComparisons = require "./helpers/lambda"
chai.use lambdaComparisons
chai.should()

describe "boolean operators", ()->

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

  describe "not", ()->
    it "should return false correctly", ()->
      notl(tru).should.logically.give fls
    it "should return true correctly", ()->
      notl(fls).should.logically.give tru

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

  describe "one", ()->
    it "should equal itself", ()->
      one.should.give one
    it "should equal the successor of zero", ()->
      (succ zero).should.give one

  describe "four", ()->
    it "should equal the successor of the successor of two", ()->
      succ(succ two).should.give four

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
    it "raising five to the power of seven should give 78125", ()->
      pow(five)(seven).should.give 78125

describe "iszero", ()->
  it "correctly distinguishes zero", ()->
    iszero(zero).should.logically.give tru
  it "correctly distinguishes one", ()->
    iszero(one).should.logically.give fls
  it "correctly distinguishes ten", ()->
    iszero(ten).should.logically.give fls

