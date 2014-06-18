
import 'dart:html';

InputElement input = querySelector("#copy_in_buffer");
InputElement output = querySelector("#copy_out_buffer");
RegExp gitUrlRegExp = new RegExp(r"((git|ssh|http(s)?)|(git@[\w\.]+))(:(//)?)([\w\.@\:/\-~]+)(\.git)(/)?");

void main() {
  input.hidden = true;
  input.value = '';

  bool parseClipboard(String data) {
    print("parseClipboard($data) == ${gitUrlRegExp.hasMatch(data)}");
    if (gitUrlRegExp.hasMatch(data)) {
      return true;
    } else {
      return false;
    }
  }

  void copyClipboard() {
    input.hidden = false;
    input.focus();
    document.execCommand('paste', true, null);
    String tempValue = input.value;
    input.value = '';
    input.hidden = true;
    output.value = parseClipboard(tempValue) ? tempValue : '';
    output.focus();
  }

  window.onFocus.listen((_) => copyClipboard());
  copyClipboard();
}