_ = require 'lodash'

biggestLot = (books)->
  _.uniq books

reduction = (lot) ->
  [0, 1, 0.95, 0.9, 0.8, 0.75][lot.length]

total = (books=[]) ->

  # regroup
  ordered = _.clone(books).sort()

  lots = []
  # dispatch each books in a lot
  while ordered.length > 0
    book = ordered.pop()
   
    lot = 0
    # is there a lot where book isnt yet? 
    while lot < lots.length and book in lots[lot]
      # not find may be pos is the next one
      lot++
    
    # no lot accept our book, create a new lot
    if lot is lots.length
      lots.push [book]
    else
      lots[lot].push book

  # compute pricing
  total = 0
  for lot in lots
    total += 8 * lot.length * reduction lot
  console.log lots
  total

module.exports = total
