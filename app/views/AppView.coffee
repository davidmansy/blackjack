class window.AppView extends Backbone.View

  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
    <span class="result"><%= result %></span>
  '

  events:
    "click .hit-button": -> @model.get('playerHand').hit()
    "click .stand-button": -> 
      @model.get('dealerHand').stand() #Changed from player to dealer
      $('.hit-button').prop "disabled", true
      $('.stand-button').prop "disabled", true
      @model.checkResult()

  initialize: ->  
    @render()
    @model.on "change:result", @render, @

  render: ->
    @$el.children().detach()
    @$el.html @template(@model.toJSON())
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

