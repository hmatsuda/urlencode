{View} = require 'atom'

module.exports =
class UrlencodeView extends View
  @content: ->
    @div class: 'urlencode overlay from-top', =>
      @div "The Urlencode package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "urlencode:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "UrlencodeView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
