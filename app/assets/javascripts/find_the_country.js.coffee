FindTheCountryView = Backbone.View.extend
  events:
    'click a#next': 'quizOnCountry'
    'click a.reload': 'reloadGame'

  initialize: (options) ->
    @$el.cssMap(
      size: 750,
      tooltips: 'hidden',
      onClick: (li) =>
        @checkCountry(li)
    )
    $.removeCookie('countryNames')
    $.removeCookie('currentQuiz')
    @countryNames = @collectCountryNames()
    @loadCountryNames()

  swapNextText: ->
    $('a#next').text('Next') if $('a#next').text() == 'Begin'

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

    if @gameCompleted()
      @alertCompleted()
      @offerGameReload()
    else
      @alertCorrect()
      @delayAndQuizAgain()

  incorrectAnswer: (answer) ->
    @hideQuiz()
    @alertIncorrect()
    @delayAndQuizAgain()

  hideQuiz: -> $('table.data-fields').hide()

  alertCorrect: (speed = 300)->
    $('#alert-box')
      .text('Correct')
      .removeClass('negative')
      .addClass('affirmative')
      .show()
      .delay(speed)
      .fadeOut(speed)

  alertIncorrect: (speed = 300)->
    $('#alert-box')
      .text('Incorrect')
      .removeClass('affirmative')
      .addClass('negative')
      .show()
      .delay(speed)
      .fadeOut(speed)

  tallyCorrect: (answer)->
    correctAnswers = $('#correct-answers > ul')
    correctAnswer = $("<li>#{answer}</li>")
    correctAnswers.append(correctAnswer)

  removeFromQuizOptions: (answer) ->
    countriesArray = @getCountryNames().split(',')
    countriesArray.splice(countriesArray.indexOf(answer), 1).join(',')
    @setCountryNames(countriesArray)

  gameCompleted: ->
    @getCountryNames() == ''

  alertCompleted: ->
    $('#alert-box')
      .text('Completed')
      .removeClass('negative')
      .addClass('completed')
      .show()

  offerGameReload: ->
    $('a#next')
      .addClass('reload')
      .text('Reload game')

  reloadGame: ->
    location.reload()

@InfoMaps ||= {}
@InfoMaps.FindTheCountryView = FindTheCountryView
