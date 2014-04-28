var i18n = (function () {
    var me = {
        add: function (props) {
            for (p in props) {
                this[p] = props[p];
            }
        }
    }
    return me;
})();

$(document).ready(function() {

    /* OPEN EXTERNALS and PDF's in NEW WINDOWS */
    $('a.rss-link, a[href^="http://"], a[href^="ftp://"], a[href^="https://"], a[href$=".rss"]').each(function() {
        var hName = window.location.hostname;
        hName = hName.replace("www.", "").toLowerCase()
        var href = $(this).attr('href');
        href = href.toLowerCase();
        //console.log("indexOf " + hName + " in " + href + " is " + href.indexOf(hName));
        if (href.indexOf(hName) == -1) {
            $(this).attr('target', '_blank');
        }
    });
    $('a[href$=".pdf"]').attr("target", "_blank");

    /* START add touch support for main navigation. */
    /*
    function menuIsOpen() {
        $('.touch #main-nav > li > ul').parent().find('a').unbind();

        $(document).bind('click', function(e) {
            // is the click on part of main-nav?
            var mainNavLi = $(e.target).closest('.touch #main-nav > li');
            if (mainNavLi.length > 0) {
                if (mainNavLi.eq(0).hasClass('touch-on')) {
                    // part of the open menu item?
                    return true;
                } else {
                    // part of another menu item?
                    e.preventDefault();
                    $('.touch #main-nav > li').removeClass('touch-on');
                    if ($('ul', mainNavLi).length > 0) {
                        $('ul', mainNavLi).parent().addClass('touch-on');
                    } else {
                        window.location = e.target;
                    }
                }
            } else {
                // not part of main nav.  close the window and rebind.
                $('.touch #main-nav > li > ul').parent().removeClass('touch-on');
                window.setTimeout(function() {
                    $('.touch #main-nav > li > ul').parent().children('a').bind('click', function(event) {
                        event.preventDefault();
                        $(event.target).closest('li').addClass('touch-on');
                        window.setTimeout(function() {
                            menuIsOpen();
                        }, 250);
                    });
                }, 250);
            }
        });
    };

    $('.touch #main-nav > li > ul').parent().children('a').bind('click', function(event) {
        event.preventDefault();
        $(event.target).closest('li').addClass('touch-on');
        window.setTimeout(function() {
            menuIsOpen();
        }, 250);
    });

    */
    
    /* END add touch support for main navigation */

    /* START search type toggle */

    var searchType = $('select#search-type').css({
        'position': 'absolute',
        'left': '-9999em'
    });
    var searchTypeSelected = $('<span>').attr({ 'id': 'search-type-selected' }).html($('option:selected', searchType).html());
    var searchTypeContainer = $('<div>')
      .attr('id', 'search-type-container')
      .append(searchTypeSelected)
      .insertAfter("#search-term");
    var searchTypeUl = $('<ul>').attr({ 'id': 'search-type-ul' })
      .appendTo(searchTypeContainer);

    $('option', searchType).each(function() {
        searchTypeUl.append(
      $('<li>')
      .attr({
          'data-value': $(this).val()
      })
      .html(
        $(this).html()
      )
      .click(function() {
          searchTypeSelected.html($(this).html());
          //$('option[value=\'' + $(this).attr('data-value') + '\']', searchType).attr("selected", "selected");
          var selectedOption = $('option:contains(' + searchTypeSelected.html() + ')', searchType);
          $('option', searchType).filter(':selected').attr('selected', '').end()
            .filter(selectedOption).attr('selected', 'selected');
          searchType.change();
          searchTypeUl.css({
              'left': '-9999em'
          });
          window.setTimeout(function() {
              searchTypeUl.css({
                  'left': '0px',
                  'position': 'relative'
              });
          }, 200)
      })
    );
    });
    $('li:last', searchTypeUl).addClass('last');
    // add focus / key nav to select replacement
    searchType.focus(function() {
        searchTypeContainer.addClass('focused');
        $(this).bind('keydown', function(e) {
            var selectedOption = $('option:contains(' + searchTypeSelected.html() + ')', searchType);
            if (e.which >= 37 && e.which <= 38) {
                if (selectedOption.prev().length === 1) {
                    searchTypeSelected.html(selectedOption.prev().html());
                    selectedOption = selectedOption.prev();
                }
            } else if (e.which >= 39 && e.which <= 40) {
                if (selectedOption.next().length === 1) {
                    searchTypeSelected.html(selectedOption.next().html());
                    selectedOption = selectedOption.next();
                }
            }
            $('option', searchType).filter(':selected').attr('selected', '').end()
          .filter(selectedOption).attr('selected', 'selected');
            searchType.val(selectedOption.val());
        });
    }).blur(function() {
        searchTypeContainer.removeClass('focused');
        searchTypeUl.removeClass('focused');
        $(this).unbind('keydown');
    });

    function searchToggleIsOpen() {
        $('.touch #search-type-ul').unbind();
        $(document).bind('click', function(e) {
            $('.touch #search-type-ul')
              .removeClass('touch-on')
              .hide()
              .bind('click', function(e) {
                  $(this).addClass('touch-on');
                  searchToggleIsOpen();
              });
            window.setTimeout(function() {
                $('.touch #search-type-ul').show();
            }, 200);
        });
    }

    $('.touch #search-type-ul').click(function(e) {
        $(this).addClass('touch-on');
        searchToggleIsOpen();
    });

    /* END search type toggle */

    $('#global-directory a').hover(
    function() {
        $(this).parent().css('background-position', '0px -34px');
    },
    function() {
        $(this).parent().css('background-position', '0px 0px');
    }
  )

    $('#print-and-share .print-button').append(
    $('<img>')
      .attr({ 'src': '<%= image_tag("print-button.png")%>', 'width': '29', 'height': '29', 'alt': '' })
      .click(function(e) {
          e.preventDefault();
          window.print();
      })
    ).append(' ').append(
    $('<a>').attr({ 'href': '#' }).click(function(e) {
        e.preventDefault();
        window.print();
    }).html(i18n.print)
  );

    $('#print-and-share .share-button').append('<div class="addthis_toolbox addthis_default_style addthis_32x32_style"><a class="addthis_button_compact" href="#">' + i18n.share + '</a></div>');
        
    $('#controller-summary table td:first-child').addClass('first-child');

    $('#unapplied-facets > section').each(function() {
    
        var hiddenValues = $('ul li:gt(9)', this);
        if (hiddenValues.length > 0) {
            $(this).append(
          $('<p>').append(         
             $('<a>')
             .attr({ 'href': '', 'class': 'more-link' })
             .html('+more options')
             .toggle(
               function() {
                   var link = $(this);
                   hiddenValues.slideDown(350, function() { link.html('-less options') });
               },
               function() {
                   var link = $(this);
                   hiddenValues.slideUp(350, function() { link.html('+more options'); });
               }
             )
           )
        );
            hiddenValues.hide();
        }
    });

    $('.article-accordion article').each(function() {
        $(this).wrapInner($('<div>').attr('class', 'inner'))
    .find('h2').prependTo($(this))
    .wrap(
      $('<a>')
      .attr({ 'href': '#', 'class': 'accordion-title' })
      .click(function(e) {
          var wasOpen = $(this).closest('article').hasClass('open');
          e.preventDefault();
          $(this).closest('.article-accordion').find('article .inner').slideUp(200).closest('article').addClass('closed').removeClass('open');
          if (!wasOpen) {
              $(this).closest('article').find('.inner').slideDown(200).closest('article').addClass('open').removeClass('closed');
          }
      })
    );
        $(this).find('.inner').hide();
    });

    $('.ie6, .ie7, .ie8').find('form .required').each(function() {
       if ($(this).is("fieldset")) {
         $(this).find('legend').prepend($('<span>').css('color', '#f00').html('* '));
       } else if ($(this).closest('.your-message').length != 0) {
         $(this).closest('section').find('h1').prepend($('<span>').css('color', '#f00').html('* '));
       } else {
         $(this).find('label').prepend($('<span>').css('color', '#f00').html('* '));
       }
   });
    
});