import 'package:flutter/material.dart';
import 'package:todo/src/controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Todo\'s'),
        actions: [
          IconButton(
              onPressed: () {
                controller.start();
              },
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: AnimatedBuilder(
          animation: controller.state,
          builder: (context, chiled) {
            return stateManagement(controller.state.value);
          }),
    );
  }

  stateManagement(HomeState state) {
    switch (state) {
      case HomeState.start:
        return _start();
      case HomeState.loading:
        return _loading();
      case HomeState.error:
        return _error();
      case HomeState.success:
        return _success();
      default:
        return _start();
    }
  }

  _error() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          controller.start();
        },
        child: const Text('Tentar novamente'),
      ),
    );
  }

  _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  _start() {
    return Container();
  }

  _success() {
    return ListView.builder(
      itemBuilder: (context, index) {
        final todo = controller.todos[index];
        return ListTile(
          leading: Checkbox(value: todo.completed, onChanged: (bool? value) {}),
          title: Text(todo.title!),
        );
      },
      itemCount: controller.todos.length,
    );
  }
}
