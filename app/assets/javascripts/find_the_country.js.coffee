FindTheCountryView = Backbone.View.extend
  events:
    'click a.next': 'quizOnCountry'

  initialize: (options) ->
    @$el.cssMap(
      size: 750,
      tooltips: 'hidden'
    )
    @countryNames = @collectCountryNames()
    @loadCountryNames()

  collectCountryNames: ->
    names = []

    @$el.find('table.data-fields .country-name').each () ->
      names.push $(this).text()

    names

  loadCountryNames: ->
    $.removeCookie 'countryNames'
    $.cookie 'countryNames', @countryNames

  quizOnCountry: ->
    names = $.cookie('countryNames').split(',')
    name = _.first(_.shuffle(names))
    @showName(name)

  showName: (name) ->
    $('.country-name').each ->
      if $(this).text() == name
        $(this).show()
        return

@InfoMaps ||= {}
@InfoMaps.FindTheCountryView = FindTheCountryView
