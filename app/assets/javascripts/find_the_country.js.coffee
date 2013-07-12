FindTheCountryView = Backbone.View.extend
  events:
    'click a.next': 'quizOnCountry'

  initialize: (options) ->
    @$el.cssMap(
      size: 750,
      tooltips: 'hidden',
      onClick: (e) => @checkCountry(e)
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

  checkCountry: (e) ->
    name = e.find('table.data-fields .country-name').text()
    currentQuiz = $.cookie('currentQuiz')

    if name == currentQuiz
      @correctAnswer(currentQuiz)
    else
      @incorrectAnswer(currentQuiz)

  correctAnswer: (currentQuiz) ->
    @alertCorrect()
    @tallyCorrect(currentQuiz)
    @removeFromQuizOptions(currentQuiz)
    @checkForComplete()

  incorrectAnswer: (currentQuiz) ->
    @alertIncorrect()
    @tallyIncorrect()

  alertCorrect: -> console.log 'correct!'

  tallyCorrect: ->
    # do something

  removeFromQuizOptions: ->
    # do something

  checkForComplete: ->
    # do something

  alertIncorrect: -> console.log 'incorrect. try again.'

  tallyInorrect: ->
    # do something

@InfoMaps ||= {}
@InfoMaps.FindTheCountryView = FindTheCountryView
