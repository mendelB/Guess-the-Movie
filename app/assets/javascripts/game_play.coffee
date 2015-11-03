# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
(($, window) ->
 
  # Define the plugin class
  class Prmpt
 
    defaults:
      buttons: []
      closeButton: false
 
    constructor: (options) ->
      @options = $.extend({}, @defaults, options)
      @el = @_builder()
      # other settings
      @_setTitle @options.title
      @_setBody @options.body

      for option in @options.buttons
        @_addButton option
      @_postAddButton()
        
      $ 'body'
        .append @el

    close: ->
      $el = $ @el
      $el
        .css 'opacity', '0'
      setTimeout ->
        $el.remove()
      , 300
        
    _setTitle: (title) ->
      @el
        .find '.title'
        .html title
        
    _setBody: (body) ->
      @el
        .find '.body'
        .append body

    _addButton: (option) ->
      option = @_preprocessButtonOption(option)
      button = @_createDom 'div', option.id, option.class
      _span = @_createDom 'span'
        .html option.text
      $el = this
      button
        .append _span
        .on 'click', ->
          option.callback $el
      @el
        .find '.footer'
          .append button
      button
      
    _preprocessButtonOption: (option) ->
      option.id = option.id or null
      option.class = option.class or null
      option

    _postAddButton: ->

      return null if @options.buttons.length < 1

      width = 100 / @options.buttons.length
      lastWidth = 100 - (@options.buttons.length - 1) * width
      @el
        .find '.footer div'
        .css 'width', width + '%'
        .last().css 'width', lastWidth + '%'
        
    _builder: ->
      _prmpt = @_createDom 'div', null, ['prmpt']
      _body = @_createDom 'div', null, 'body'
      _title = @_createDom 'div', null, 'title'
      _footer = @_createDom 'div', null, 'footer'
      _prmpt
        .append _body.append _title
        .append _footer
      
      if @options.closeButton
        self = this
        _close = @_createDom 'div', null, 'close'
        _closeSign = @_createDom 'i', null, ['fa', 'fa-close']
          .on 'click', ->
            self.close()
        _prmpt
          .append _close.append _closeSign

      _prmpt

    _createDom: (_tag, _id, _class, open)->
      dom = if open == undefined || open then $ "<#{_tag}></#{_tag}>" else $ "<#{_tag}>"      
      dom.attr 'id', _id if _id

      if _class and typeof _class == 'string'
        dom.addClass _class
      else if _class
        for __class in _class
          dom.addClass __class

      dom

  # Define the plugin
  $.extend prmpt: (option) ->
    data = new Prmpt(option)

) window.jQuery, window

