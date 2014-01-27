#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'result', 'Test'

  @self = @

  checkResultDealer: ->
    scoreDealer = (@.get 'dealerHand').scores()[0]
    scorePlayer = (@.get 'playerHand').scores()[0]

    if scoreDealer > 21
      @set 'result', 'Won'
      @trigger 'gameEnd'
    else if scoreDealer <= scorePlayer or (scoreDealer > scorePlayer and scoreDealer <= 17)
      (@get 'dealerHand').hit()
      do @checkResultDealer
    else if scoreDealer is scorePlayer and scoreDealer is 21
        @set 'result', 'Tie!'
        @trigger 'gameEnd'
    else
        @set 'result', 'Lost'
        @trigger 'gameEnd'

  checkResultPlayer: ->
    scorePlayer = (@.get 'playerHand').scores()[0]
    if scorePlayer > 21
      @set 'result', 'Lost!'
      @trigger 'gameEnd'

#Player
  # When a card is added in the hand player and the score goes over 21 -> the player loses
#Dealer
  # When a card is added in the dealer player and
    #the score goes over 21 -> the player wins
    #the dealer score < player score
      #-> a card is added to the dealer hand
    #the dealer score > player score and dealer score <= 17
      #-> a card is added to the dealer hand
    #the dealer score = the player score = 21 -> result is tie
    #the dealer score is > player score and dealer score > 17 and dealer score <=21
      #-> the player loses 