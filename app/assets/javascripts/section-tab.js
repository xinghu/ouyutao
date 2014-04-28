$(document).ready(function(){
  $('.tabs').each(function(){
    var tContainer = $(this).wrap($('<div>').attr('class', 'tab-container'));
    var tNav = $('<ul>').attr('class', 'tab-nav').insertBefore(tContainer);
    // make a tab for each section.
    $('section', tContainer).each(function(){
      var currentSection = $(this);
      tNav.append(
        $('<li>').append(
          $('<a>').attr({ 'href': '#' }).html($('h1', currentSection).html()).click(function(e) {
            e.preventDefault();
            $('li', tNav).removeClass('selected').filter($(this).parent()).addClass('selected');
            $('section', tContainer).hide().filter(currentSection).show();
            $.cookie('lastTab', '{"url": "' + window.location + '", "tabIndex": ' + currentSection.index() + '}');
          })
        )
      );
      currentSection.children('h1').hide();
      $('h2:first-child', currentSection)
        .add($('h1:first-child', currentSection)
        .siblings('h2:first'))
        .addClass("first");
    }).hide();

    var lastTab = $.parseJSON($.cookie('lastTab'));
    var cs = 'first';
    if (lastTab && lastTab.url == window.location) {
        var cs = 'nth-child(' + (lastTab.tabIndex + 1) + ')';
    }
    $('section:' + cs, tContainer).show();
    $('li:' + cs, tNav).addClass('selected');
  });
});