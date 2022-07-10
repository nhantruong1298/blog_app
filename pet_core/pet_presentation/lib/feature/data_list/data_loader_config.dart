import 'package:pet_domain/enum/data_type.dart';

class DataLoaderConfig {
  final DataType dataType;
  final dynamic optionalParams;
  final bool isPaging;

  DataLoaderConfig(this.dataType, {this.optionalParams, this.isPaging = false});
}
