var attachPopovers = function(){

  // Attach popovers to each stat box - the content is stored in divs immediately
  // after the stat box (siblings on same level in DOM).
  $(".statbox-wrapper").each(function(index, element) {
    $(element).popover({
      trigger: 'hover',
      container: '.at-a-glance-outer',
      placement: 'bottom',
      content: function() {
        return $(element).nextAll(".stat-help:first").text();
      }
    });

  });

}

$(document).ready(attachPopovers);
$(document).on('page:load', attachPopovers );
