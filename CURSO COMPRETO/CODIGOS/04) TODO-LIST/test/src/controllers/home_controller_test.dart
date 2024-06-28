import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo/src/controllers/home_controller.dart';
import 'package:todo/src/models/todo_model.dart';
import 'package:todo/src/repositories/todo_repositories.dart';

class TodoRepositoryMock extends Mock implements TodoRepository {}

void main() {
  final repository = TodoRepositoryMock();

  final controller = HomeController(repository);

  test('deve preencher variável todos', () async {
    when(() => repository.fetchTodos()).thenAnswer((_) async => [TodoModel()]);
    expect(controller.state, HomeState.start);
    await controller.start();
    expect(controller.state, HomeState.success);
    expect(controller.todos.isNotEmpty, true);
  });

  // controller.state = HomeState.start;

  test('deve modificar estado para `error` se a requisição falhar', () async {
    when(() => repository.fetchTodos()).thenThrow(Exception());
    await controller.start();
    expect(controller.state, HomeState.error);
  });
}
