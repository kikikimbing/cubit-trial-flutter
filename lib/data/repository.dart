import 'models/todo.dart';
import 'network_service.dart';

class Repository {
  final NetworkService? networkService;

  Repository({this.networkService});

  Future<Iterable<Todo>?> fetchTodos() async {
    final todosRaw = await networkService?.fetchTodos();
    return todosRaw?.map((e) => Todo.fromJson(e));
  }

  Future<bool?> changeCompletion(bool isCompleted, int id) async {
    final patchObj = {"isCompleted": isCompleted.toString()};

    return await networkService!.patchTodo(patchObj, id);
  }
}
