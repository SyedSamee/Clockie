extension String_extention on String {
  String get timeIdentifier {
    return this.length <= 1 ? "0${this}" : this;
  }
}
