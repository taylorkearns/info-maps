FindTheCountryView = Backbone.View.extend
  events:
    'click a.reload': 'reloadGame'

  initialize: (options) ->
    @$el.cssMap(
      size: 750,
      tooltips: 'hidden',
      onClick: (li) =>
        @checkCountry(li) unless @noGame()
    )

    $.removeCookie('countryNames')
    $.removeCookie('currentQuiz')
    $.cookie('skips', '0')
    $.cookie('turns', '0')

    @countryNames = @collectCountryNames()
    @loadCountryNames()
    @maxPoints = @countryNames.length
    @setScore(@maxPoints)

    @$el.find('a#next').on 'click', =>
      @quizOnCountry()

      unless @gameNotStarted()
        @penalize(0.5)
        @displayScore()
        @increment('skip')

      @increment('turn')

  gameNotStarted: ->
    $.cookie('turns') == '0'

  increment: (event) ->
    $.cookie("#{event}s", $.cookie("#{event}s") + 1)

  swapNextText: ->
    $('a#next').text('Next') if @gameNotStarted()

  getCountryNames: ->
    $.cookie('countryNames')

  setCountryNames: (names) ->
    $.cookie('countryNames', names)

  setCurrentQuiz: (name) ->
    $.cookie('currentQuiz', name)

  getCurrentQuiz: ->
    $.cookie('currentQuiz')

  collectCountryNames: ->
    names = []

    @$el.find('table.data-fields .country-name').each ->
      names.push $(this).text()

    names

  loadCountryNames: ->
    $.cookie('countryNames', @countryNames)

  quizOnCountry: ->
    names = @getCountryNames().split(',')
    name = _.first(_.shuffle(names))
    @showName(name)
    @setCurrentQuiz(name)
    @swapNextText()

  delayAndQuizAgain: (speed = 600) ->
    window.setTimeout (=> @quizOnCountry()), speed

  showName: (name) ->
    $('.country-name').each ->
      $('#alert-box').hide()
      if $(this).text() == name
        $(this).parents('table').show()
      else
        $(this).parents('table').hide()

  checkCountry: ($listItem) ->
    answer = $listItem.find('table.data-fields .country-name').text()
    currentQuiz = @getCurrentQuiz()

    if answer == currentQuiz
      @correctAnswer(answer)
    else
      @incorrectAnswer(answer)

  correctAnswer: (answer) ->
    @hideQuiz()
    @tallyCorrect(answer)
    @removeFromQuizOptions(answer)
    @displayScore()
    @increment('turn')

    if @gameCompleted()
      @alertCompleted()
      @displayScore()
      @offerGameReload()
    else
      @alertCorrect()
      @delayAndQuizAgain()

  incorrectAnswer: (answer) ->
    @hideQuiz()
    @alertIncorrect()
    @penalize(1)
    @displayScore()
    @increment('turn')
    @delayAndQuizAgain()

  hideQuiz: -> $('table.data-fields').hide()

  alertCorrect: (speed = 300) ->
    $('#alert-box')
      .text('Correct')
      .removeClass('negative')
      .addClass('affirmative')
      .show()
      .delay(speed)
      .fadeOut(speed)

  alertIncorrect: (speed = 300) ->
    $('#alert-box')
      .text('Incorrect')
      .removeClass('affirmative')
      .addClass('negative')
      .show()
      .delay(speed)
      .fadeOut(speed)

  tallyCorrect: (answer) ->
    correctAnswers = $('#correct-answers > ul')
    correctAnswer = $("<li>#{answer}</li>")
    correctAnswers.append(correctAnswer)

  removeFromQuizOptions: (answer) ->
    countriesArray = @getCountryNames().split(',')
    countriesArray.splice(countriesArray.indexOf(answer), 1).join(',')
    @setCountryNames(countriesArray)

  getScore: ->
    $.cookie('score')

  setScore: (points) ->
    $.cookie('score', points)

  penalize: (points) ->
    @setScore($.cookie('score') - points)

  gameCompleted: ->
    @getCountryNames() == ''

  alertCompleted: ->
    $('#alert-box')
      .text('Completed')
      .removeClass('negative')
      .addClass('completed')
      .show()

  displayScore: ->
    $('#score .ratio').text(@scoreRatio())
    $('#score .percentage').text(@scorePercentage())

  scoreRatio: ->
    "#{@getScore()}/#{@maxPoints}"

  scorePercentage: ->
    "#{Math.round(100 * (@getScore() / @maxPoints))}%"

  offerGameReload: ->
    $('a#next')
      .addClass('reload')
      .text('Reload game')

  reloadGame: ->
    location.reload()

  noGame: ->
    @gameNotStarted() || @gameCompleted()

@InfoMaps ||= {}
@InfoMaps.FindTheCountryView = FindTheCountryView
