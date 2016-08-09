$(document).on("turbolinks:load", function() {
  if ($('#infinite-scrolling').size() > 0) {
    $(window).on('scroll', function() {
      var more_posts_url;
      more_posts_url = $('.pagination .next a').attr('href');
      if (more_posts_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60) {
        $('.pagination').html('<img src="/assets/ajax-loader.gif" alt="Loading..." title="Loading..." />');
        $.getScript(more_posts_url);
        return;
      }
    });
  }
});