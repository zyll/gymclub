_ = require 'lodash'

harry =
  biggestLot: (books)->
    _.uniq books

  reduction: (lot) ->
    [0, 1, 0.95, 0.9, 0.8, 0.75][lot.length]

  total: (books=[]) ->
    big = harry.biggestLot(books)
    if big.length is books.length
      harry.reduction(books) * books.length * 8
    else
      harry.total(harry.removeLot books, big) + harry.total(big)

  removeLot: (from, lot)->
    cleaned = _.clone from
    for book in lot
      cleaned.splice (_.indexOf cleaned, book), 1
    cleaned

module.exports = harry
