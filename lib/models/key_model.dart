//This class contains the data required to build the symbol key on the key_facilities screen
class KeySymbolClass {
  const KeySymbolClass(
      {this.facilityName,
      this.symbolCategory,
      this.backgroundIndicator,
      this.symbol,
      this.symbolDescription});

  final String facilityName;
  final String symbolCategory;
  final String backgroundIndicator;
  final String symbol;
  final String symbolDescription;
}
