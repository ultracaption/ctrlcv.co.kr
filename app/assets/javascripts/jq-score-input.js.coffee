#= jquery-1.8.2

class ScoreControl
  constructor: (@elem) ->
    @$ = $(@elem)

  initialize: (options) ->
    @$target = if options.target
      @$.find(options.target)
    else
      @$

    @$progressBar = if options.progressBar
      @$.find(options.progressBar)
    else
      @$target

    @$input = @$.find(options.input || 'input')

    @$target.bind 'click', (e) =>
      @onClick(e)

  onClick: (e) ->
    positionX = e.offsetX / @$target.width()
    roundedScore = Math.round(positionX * 10)
    roundedScore += 1 if roundedScore == 0
    roundedScore = 10 if roundedScore > 10
    @$progressBar.css('width', "#{roundedScore * 10}%").text(roundedScore)
    @$input.val(roundedScore)

$.fn.scoreInput = (options = {}) ->
  @each () ->
    new ScoreControl(@).initialize(options)
