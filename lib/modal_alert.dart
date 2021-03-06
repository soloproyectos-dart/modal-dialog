part of modal_dialog;

/// A modal alert dialog.
///
/// It consists on a modal message with an 'Accept' button.
///
///     // Shows a modal alert with a title and a message.
///     // In this case the 'Accept' button closes the modal dialog.
///     new ModalAlert('Error', 'An error has occcurred');
///
///     // When the user presses the 'Accept' button, it prints a message
///     // and closes the modal dialog.
///     new ModalAlert(
///       'Error', 'An error has occurred',
///       accept: (ModalDialog dialog) {
///         print('Ok');
///         dialog.close();
///       }
///     );
///
///     // Creates a 'hidden' modal dialog and then
///     // accesses the modal instance.
///     ModalDialog dialog = new ModalAlert(
///       'Error', 'An error has occurred', show: false
///     );
///     dialog.open().then((Modal modal) {
///       // We can access the modal instance here.
///       modal.show();
///     });
///
class ModalAlert extends ModalMessage {
  Future<Null> _open;
  String _locale;
  String _acceptLabel;
  _ActionCallback _accept;

  String get locale => _locale;

  /// Creates a modal alert dialog with a [title] and a [text].
  ///
  /// The text can be either plain-text or HTML, depending on the [html] flag.
  /// The button's label depends on the [locale] parameter, even though it can
  /// be changed directly from the [acceptLabel] parameter.
  ///
  /// When the users presses the 'Accept' button, the dialog calls the [accept]
  /// function. If this parameter is omitted, the dialog is closed by default.
  ModalAlert(String title, String text,
      {bool html,
      String locale,
      String acceptLabel,
      _ActionCallback accept: _defaultAction})
      : super(title, text, html: html) {
    this._locale = locale;
    this._acceptLabel = acceptLabel;
    this._accept = accept;
  }

  @override
  Future<Null> open() async {
    if (_open == null) {
      _open = new Future<Null>(() async {
        String locale = await _getLocale(_locale);
        await initializeMessages(locale);
        Intl.withLocale(
            locale,
            () => addButton(_acceptLabel ?? ButtonMessage.accept,
                action: _accept, type: 'primary'));
        _modal.show();
      });
    }
    return _open;
  }
}
