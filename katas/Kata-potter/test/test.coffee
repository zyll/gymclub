harry = require('../app/order')
total = harry.total
should = require 'should'

check = (books, size, reduction, price)->
  it "#{books} biggest lot is size #{size}", ->
    harry.biggestLot(books).length.should.eql size

  it "#{books} reduction is #{reduction}", ->
    harry.reduction(books).should.eql reduction

  it "#{books} price is #{price}", ->
    total(books).should.eql price

it 'total is a function', ->
  total.should.be.a 'function'

describe 'cart', ->
  
  check [],              0, 0, 0
  check [0],             1, 1, 8
  check [0, 1],          2, 0.95, 2 * 8 * 0.95
  check [0, 1, 2],       3, 0.9 , 3 * 8 * 0.9
  check [0, 1, 2, 3],    4, 0.8 , 4 * 8 * 0.8
  check [0, 1, 2, 3, 4], 5, 0.75, 5 * 8 * 0.75
