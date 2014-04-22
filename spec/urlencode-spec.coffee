{WorkspaceView} = require 'atom'
Urlencode = require '../lib/urlencode'

describe "Urlencode", ->
  [activationPromise, editor, editorView] = []

  encode = (callback) ->
    editorView.trigger "urlencode:encode"
    waitsForPromise -> activationPromise
    runs(callback)

  decode = (callback) ->
    editorView.trigger "urlencode:decode"
    waitsForPromise -> activationPromise
    runs(callback)

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    atom.workspaceView.openSync()

    activationPromise = atom.packages.activatePackage('urlencode')

    editorView = atom.workspaceView.getActiveView()
    editor = editorView.getEditor()

    editor.setText """
      http://www.yahoo.co.jp
    """
    editor.setSelectedBufferRange([[0, 0], [0, 22]])


  describe "when entire are selected", ->
    it "urlencodes the selected lines", ->
      encode ->
        expect(editor.getText()).toBe """
          http%3A%2F%2Fwww.yahoo.co.jp
        """

    it "urldecodes the selected lines", ->
      decode ->
        expect(editor.getText()).toBe """
          http://www.yahoo.co.jp
        """
