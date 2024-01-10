import 'base_model.dart';

abstract class BaseDio {
  Future dioGet<T extends BaseModel<T>>(String path, T model);
}
