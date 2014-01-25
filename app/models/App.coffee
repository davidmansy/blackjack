#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'result', 'Test'

  checkResult: ->
    scoreDealer = (@.get 'dealerHand').scores()[0]
    scorePlayer = (@.get 'playerHand').scores()[0]
    debugger;
    if scoreDealer < 17
    	(@get 'dealerHand').hit()
    	do @checkResult
    else if scoreDealer > 21
    	@set 'result', 'Congratulations! You won!'
    else if 17 <= scoreDealer <= 21 and scoreDealer > scorePlayer
    	@set 'result', 'Dammned! You lost!'
    	
    

