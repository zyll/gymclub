_ = require 'lodash'

biggestLot = (books)->
  _.uniq books

reduction = (lot) ->
  [0, 1, 0.95, 0.9, 0.8, 0.75][lot.length]

totalLots = (lots)->
  total = 0
  for lot in lots
    total += 8 * lot.length * reduction lot
  total

# dispatch each books in a lot, dispatching first the more present book
splitToLots = (counts)->
  lots = []
  for book, i in counts
    for j in [0..book.nb - 1]
      if i is 0
        lots.push [book.id]
      else
        lots[j].push book.id
  lots

countBooks = (books)->
  ordered = _.clone(books).sort()
  counts = []
  for book in _.uniq ordered
    first = ordered.indexOf book
    last = ordered.lastIndexOf book
    counts.push id: book, nb: last - first + 1
  counts.sort (a, b)->
    b.nb - a.nb

total = (books=[]) ->

  lots = splitToLots countBooks books

  # compute pricing
  total = totalLots(lots)

  # try to reduce price
  if _.first(lots)?.length > _.last(lots)?.length + 1
    unless _.last(_.first(lots)) in _.last lots
      _.last(lots).push _.first(lots).pop()
      newTotal = totalLots(lots)
      if newTotal < total
        total = newTotal

  total

module.exports = total
