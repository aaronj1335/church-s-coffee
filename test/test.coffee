require "coffee-script"
require("./../lib/lambda.coffee").globalize()
assert = require("assert")

equiv = (a, b)-> assert.equal a.toString(), b.toString()

describe "boolean operators", ()->

  describe "and", ()->
    it "should return true correctly", ()->
      assert.equal andl(tru)(tru), tru
    it "should return false correctly", ()->
      assert.equal andl(tru)(fls), fls
      assert.equal andl(fls)(tru), fls
      assert.equal andl(fls)(fls), fls

  describe "or", ()->
    it "should return true correctly", ()->
      assert.equal orl(tru)(tru), tru
      assert.equal orl(tru)(fls), tru
      assert.equal orl(fls)(tru), tru
    it "should return false correctly", ()->
      assert.equal orl(fls)(fls), fls

  describe "not", ()->
    it "should return false correctly", ()->
      assert.equal notl(tru), fls
    it "should return true correctly", ()->
      assert.equal notl(fls), tru

describe "pairs", ()->

  describe "fst", ()->
    it "should return the first value", ()->
      assert.equal fst(pair(tru)(fls)), tru

  describe "snd", ()->
    it "should return the second value", ()->
      assert.equal snd(pair(tru)(fls)), fls

describe "numbers", ()->

  describe "one", ()->
    it "should equal the successor of zero", ()->
      equiv succ(zero), one
