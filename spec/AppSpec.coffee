describe 'app rules', ->
  app = null
  deck = null
  hand = null

  beforeEach ->
    app = new App
    deck = new Deck()
    playerHand = deck.dealPlayer()
    dealerHand = deck.handPlayer()
    app.set 'playerHand', deck.dealPlayer()
    app.set 'dealerHand', deck.dealDealer()
    app.set 'result', 'test'

  describe 'player', ->
    it "should lose when the player score > 21", ->
      
      expect(deck.last()).toEqual hand.hit()
      expect(deck.length).toBe 49
      expect(deck.last()).toEqual hand.hit()
      expect(deck.length).toBe 48
