part of modal_dialog;

// TODO: button messages are customizables (acceptLabel)
// TODO: locale parameters
class ModalAlert extends ModalDialog {
  String _title;
  String _text;
  bool _html;
  ActionCallback _accept;
  ModalMessage _modalMessage;

  /// Creates a modal alert dialog with a [title] and a message.
  ///
  /// The message can be either a plain [text] or a [html] text.
  /// The [accept] function is called when the 'Accept' button is pressed.
  ModalAlert(this._title, this._text,
      {bool html, bool show: true, ActionCallback accept: defaultAction}) {
    this._html = html;
    this._accept = accept;

    if (show) {
      open();
    }
  }

  Future<Modal> open() async {
    if (_modalMessage == null) {
      _modalMessage = new ModalMessage(_title, _text, html: _html, show: false);
      await initializeMessages(Intl.defaultLocale).then((dynamic _) {
        _modalMessage.addButton(ButtonMessage.accept,
            action: _accept, type: 'primary');
      });
    }
    return _modalMessage.open();
  }
}
