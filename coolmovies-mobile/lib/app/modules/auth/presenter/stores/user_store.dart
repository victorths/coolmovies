import 'package:coolmovies/app/commons/utils/exports.dart';

class UserStore {
  final users = RxList<UserEntity>([]);

  final _currentUser = Rx<UserEntity?>(null);
  UserEntity? get currentUser => _currentUser.value;
  set currentUser(UserEntity? value) => _currentUser.value = value;

  final _error = ''.obs;
  String get error => _error.value;
  set error(String value) => _error.value = value;

  final _loading = true.obs;
  bool get loading => _loading.value;
  set loading(bool value) => _loading.value = value;

  void load() => loading = true;

  void completeWithData(List<UserEntity> data) {
    users.assignAll(data);
    error = '';
    loading = false;
  }

  void completeWithError(String error) {
    this.error = error;
    users.clear();
    loading = false;
  }

  StoreState get state {
    return loading
        ? StoreState.loading
        : error.isNotEmpty
            ? StoreState.error
            : users.isEmpty
                ? StoreState.noContent
                : StoreState.await;
  }
}
