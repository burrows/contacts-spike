$(function() {
  var trees = $('.contact-tree').tree({
    ui: {
      theme_name: 'classic'
    },
    plugins: {
      contextmenu: {
        items: {
          remove: false,
          create: false,
          rename: false,
          open: {
            label: 'Open',
            action: function(node, tree) {
              document.location = $(node).find('a').attr('href');
            }
          }
        }
      }
    },
    callback: {
      onmove: function(node, refNode, type, treeObj, rb) {
        console.log($.makeArray(arguments));
        $.post('/organizations/move', {
          node: $(node).attr('data-org-id'),
          ref:  $(refNode).attr('data-org-id'),
          type: type
        });
      }
    }
  });

  var tree = $.tree.reference('.contact-tree');

  $('form').submit(function(e) {
    var form = e.target;
    e.preventDefault();
    $.post(form.action, $(form).serialize(), function(data, status) {
      $(form).find(':input:text').val('');
      tree.create(data, $('.root-node'), 'inside');
    }, 'json');
  })
});
