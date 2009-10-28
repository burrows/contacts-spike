$(function() {
  $('.contact-tree').tree({
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
});
