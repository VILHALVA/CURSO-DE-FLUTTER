import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:todo/src/repositories/todo_repositories.dart';

class DioMock extends Mock implements Dio {}

main() async {
  final dio = Dio();
  final dioAdapter = DioAdapter(dio: dio);

  // substitui o adapter original pelo novo client
  dio.httpClientAdapter = dioAdapter;

  final repository = TodoRepository(dio);

  final file = File('assets/tests/repositories/todo_payload.json');
  final jsonString = await file.readAsString();

  // faz a intercepção da rota, substituindo o when do mockito
  dioAdapter.onGet(
    repository.url,
    (server) => server.reply(
      200,
      jsonDecode(jsonString),
    ),
  );

  // passa o dio com a injeção do adapter como injeção de dependência para o Repository
  test('deve trazer uma lista de TodoModel', () async {
    final list = await repository.fetchTodos();
    expect(list[1].title, 'quis ut nam facilis et officia qui');
  });
}
