window.Rfpez ||= {
  Backbone: {}
}

Rfpez.current_page = (str) ->
  if str is Rfpez.current_page_string
    true
  else
    false

$(document).on 'shown', '#signinModal', ->
  $("#signinModal #email").focus()

$(document).on "click", "a[data-confirm]", (e) ->
  e.preventDefault() unless confirm($(@).data('confirm'))

$(document).on "submit", "#new-contract-form", (e) ->
  return e.preventDefault() unless $(this).find('input[name=solnbr]').val()
  $(this).find("button[type=submit]").button('loading')

$(document).on "click", "[data-select-text-on-focus]", (e) ->
  $(this).select()

$(document).on "mouseenter", ".helper-tooltip", (e) ->
  $(this).tooltip()
  $(this).tooltip('show')

$(document).on "mouseleave", ".helper-tooltip", (e) ->
  $(this).tooltip('hide')

$(document).on "click", ".hide-show-toggler", (e) ->
  e.preventDefault()
  target_id = $(this).attr('data-target')
  $('#' + target_id).toggle()

$(document).on "ready page:load", ->
  $("[data-onload-focus]:eq(0)").focus()
  $("span.timeago").timeago()
  $('input, textarea').placeholder()

  if $("body").hasClass('officer')
    $('.datepicker-wrapper').datepicker()

    default_start_date = new Date()
    default_start_date.setHours(23, 59)
    $('.datetimepicker-wrapper').datetimepicker({
        format: "m/d/yy H:ii P",
        startDate: default_start_date,
        minView: 2,
        autoclose: true,
        showMeridian: true,
        todayBtn: false,
        keyboardNavigation: false
      })

    $('.wysihtml5').ckeditor()

  Rfpez.current_page_string = $("body").data('current-page')
