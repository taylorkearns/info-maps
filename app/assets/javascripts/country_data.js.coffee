CountryDataView = Backbone.View.extend
  initialize: (options) ->
    @$el.cssMap(
      size: 750,
      'onClick': (e) => @showData(e)
    )

  showData: (li) ->
    $('table.data-fields').hide()
    li.find('table.data-fields').show()

@InfoMaps ||= {}
@InfoMaps.CountryDataView = CountryDataView
