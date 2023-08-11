class Input {
  static Map<String, dynamic> values = {};
  static Map<String, InputControlState> inputController = {};

  static set(key, value) {
    inputController[key]?.setValue(value);
  }

  static get(key) {
    return inputController[key]?.getValue();
  }

  static focus(key) {
    return inputController[key]?.focus();
  }

  static clear(key) {
    values.remove(key);
  }

  static resetValues() {
    inputController.forEach((key, value) {
      value.resetValue();
    });
  }
}

class InputControlState {
  getValue() {}
  setValue(value) {}
  resetValue() {}
  focus() {}
}
