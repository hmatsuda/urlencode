UrlencodeView = require './urlencode-view'

module.exports =
  urlencodeView: null

  activate: (state) ->
    @urlencodeView = new UrlencodeView(state.urlencodeViewState)

  deactivate: ->
    @urlencodeView.destroy()

  serialize: ->
    urlencodeViewState: @urlencodeView.serialize()
