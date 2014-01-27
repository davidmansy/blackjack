class window.AppView extends Backbone.View

  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
    <span class="result"><%= result %></span>
  '

  events:
    "click .hit-button": ->
      @model.get('playerHand').hit()
      @model.checkResultPlayer()
    "click .stand-button": -> 
      @model.get('dealerHand').stand()
      @disableButtons
      @model.checkResultDealer()

  initialize: ->  
    @render()
    @model.on "change:result", @render, @
    @model.on "gameEnd", @disableButtons, @

  render: ->
    @$el.children().detach()
    @$el.html @template(@model.toJSON())
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

  disableButtons: ->
    console.log "Buttons disabled"
    $('.hit-button').prop "disabled", true
    $('.stand-button').prop "disabled", true
