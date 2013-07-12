FindTheCountryView = Backbone.View.extend
  events:
    'click a.next': 'quizOnCountry'

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

  collectCountryNames: ->
    names = []

    @$el.find('table.data-fields .country-name').each ->
      names.push $(this).text()

    names

  loadCountryNames: ->
    $.cookie('countryNames', @countryNames)

  quizOnCountry: ->
    names = $.cookie('countryNames').split(',')
    name = _.first(_.shuffle(names))
    @showName(name)
    $.cookie('currentQuiz', name)

  showName: (name) ->
    $('.country-name').each ->
      if $(this).text() == name
        $(this).parents('table').show()
        return

  checkCountry: ($listItem) ->
    answer = $listItem.find('table.data-fields .country-name').text()
    currentQuiz = $.cookie('currentQuiz')

    if answer == currentQuiz
      @correctAnswer(answer)
    else
      @incorrectAnswer(answer)

  correctAnswer: (answer) ->
    @alertCorrect()
    @tallyCorrect(answer)
    @removeFromQuizOptions(answer)
    @checkForComplete()

  incorrectAnswer: (answer) ->
    @alertIncorrect()
    @tallyIncorrect()

  alertCorrect: -> console.log 'correct!'

  tallyCorrect: (answer)->
    correctAnswers = $('#correct-answers > ul')
    correctAnswer = $("<li>#{answer}</li>")
    correctAnswers.append(correctAnswer)

  removeFromQuizOptions: (answer) ->
    # do something

  checkForComplete: ->
    # do something

  alertIncorrect: -> console.log 'incorrect. try again.'

  tallyIncorrect: ->
    # do something

@InfoMaps ||= {}
@InfoMaps.FindTheCountryView = FindTheCountryView
