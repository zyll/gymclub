total = require '../app/order'
should = require 'should'

check = (books, price)->
  it "#{books} price is #{price}", ->
    total(books).should.eql price

it 'total is a function', ->
  total.should.be.a 'function'

describe 'cart', ->
  check [], 0
  check [0], 8
  check [0, 1], 2 * 8 * 0.95
  check [0, 1, 2], 3 * 8 * 0.9
  check [0, 1, 2, 3], 4 * 8 * 0.8
  check [0, 1, 2, 3, 4], 5 * 8 * 0.75
  check [0, 1, 2, 3, 4, 0], 5 * 0.75 * 8 + 8
  check [0, 1, 2, 3, 3, 0], 4 * 0.8 * 8 + 2 * 8 * 0.95
  check [0, 0, 1], 2 * 0.95 * 8 + 8
  check [0, 1, 2, 3, 3, 0], 4 * 0.8 * 8 + 2 * 8 * 0.95
  check [0, 0, 1, 1, 2, 2, 3, 4], Math.min(2 * (8 * 4 * 0.8), 5 * 8 * 0.75 + 3 * 8 * 0.9)
