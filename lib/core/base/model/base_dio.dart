import 'base_model.dart';

abstract class BaseDio {
  Future dioGet<T extends BaseModel>(String path, T model);
}
