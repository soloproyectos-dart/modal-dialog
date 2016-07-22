part of modal_dialog;

// TODO: image property
class ModalLoading extends ModalDialog {
  String _loadingImage =
      'data:image/gif;base64,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';
  DomElement _target;
  DomElement _cancelButton;
  Modal _modal;

  DomElement get target => _target;

  ModalLoading() {
    _target = $('<div class="modal" role="dialog" />')
      ..append((DomElement target) {
        target
          ..appendElement($('<div class="modal-dialog modal-sm" />')
            ..append((DomElement target) {
              target
                ..appendElement($('<div class="modal-content" />')
                  ..appendElement($('<div class="modal-body" />')
                    ..appendElement($('<div />')
                      ..css['display'] = 'table'
                      ..css['text-align'] = 'center'
                      ..css['margin'] = '0 auto'
                      ..appendElement($('<p>')
                        ..appendElement($('<img />')
                          ..attr['src'] = _loadingImage
                          ..attr['alt'] = 'Loading...'))
                      ..append((DomElement target) {
                        _cancelButton = $(
                            '<button type="button" class="btn btn-primary" />')
                          ..text = 'Cancel'
                          ..appendTo(target);
                      }))));
            }));
      })
      ..appendTo(find('body'));

    _modal =
        new Modal(_target.nativeElement, keyboard: false, backdrop: 'static');
    _modal.show();
  }

  void onCancel(Function listener) => _cancelButton.on('click', listener);

  void close() {
    _modal.hide();
    _target.remove();
  }
}