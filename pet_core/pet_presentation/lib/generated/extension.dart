import 'package:pet_presentation/generated/assets.gen.dart';

extension AssetsGen on Assets {
  static const packageName = 'packages/pet_presentation';

  static String getRawString(String assetName) {
    return '$packageName/$assetName';
  }
}
