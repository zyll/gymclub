_ = require 'lodash'

harry =
  biggestLot: (books)->
    _.uniq books

  reduction: (lot) ->
    [0, 1, 0.95, 0.9, 0.8, 0.75][lot.length]

  total: (books=[]) ->
    harry.biggestLot(books).length * 8 * harry.reduction(harry.biggestLot(books))

module.exports = harry
