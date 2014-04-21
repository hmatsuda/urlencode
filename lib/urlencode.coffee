urlencode = require 'urlencode'
module.exports =
  activate: (state) ->
    atom.workspaceView.command "urlencode:encode", '.editor', ->
      editor = atom.workspace.activePaneItem
      
      encodedText = urlencode(editor.getSelection().getText())
      editor.getSelection().insertText(encodedText)

    atom.workspaceView.command "urlencode:decode", '.editor', ->
      editor = atom.workspace.activePaneItem
      
      encodedText = urlencode.decode(editor.getSelection().getText())
      editor.getSelection().insertText(encodedText)
