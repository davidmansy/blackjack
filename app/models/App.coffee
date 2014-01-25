#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'result', 'Test'

  checkResultDealer: ->
    scoreDealer = (@.get 'dealerHand').scores()[0]
    scorePlayer = (@.get 'playerHand').scores()[0]
    # scoreDealer = 15
    # scorePlayer = 14
    if scoreDealer < 17
      (@get 'dealerHand').hit()
#      setTimeout 2000, =>
      do @checkResultDealer
    else if scoreDealer > 21
      @set 'result', 'Congratulations! You won!'
    else if 17 <= scoreDealer <= 21
      if scoreDealer < scorePlayer
#        setTimeout 2000, =>
        (@get 'dealerHand').hit()
        do @checkResultDealer
      else
        @set 'result', 'Dammned! You lost!'

  checkResultPlayer: ->
    scorePlayer = (@.get 'playerHand').scores()[0]
    if scorePlayer > 21
      @set 'result', 'Dammned! You lost!'
