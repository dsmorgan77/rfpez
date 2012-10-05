// Generated by CoffeeScript 1.3.3
(function() {

  window.Rfpez || (window.Rfpez = {});

  $(document).on('shown', '#signinModal', function() {
    return $("#signinModal #email").focus();
  });

  $(document).on("click", "a[data-confirm]", function(e) {
    var el;
    e.preventDefault();
    el = $(this);
    if (confirm(el.data('confirm'))) {
      return window.location = el.attr('href');
    }
  });

  $(document).on("submit", "#new-contract-form", function(e) {
    if (!$(this).find('input[name=solnbr]').val()) {
      return e.preventDefault();
    }
    return $(this).find("button[type=submit]").button('loading');
  });

  $(function() {
    return $("[data-onload-focus]:eq(0)").focus();
  });

}).call(this);
