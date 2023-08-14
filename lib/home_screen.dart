import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_concepts/main.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});
  // updating a value of state provider
  void onSubmit(WidgetRef ref, String value) {
    ref.read(stateProvider.notifier).update((state) => value);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.read(nameProvider);
    final state = ref.watch(stateProvider) ?? '';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text('Riverpod Concepts'),
      ),
      body: Column(
        children: [
          TextField(
            onSubmitted: (value) {
              onSubmit(ref, value);
            },
          ),
          Center(
            child: Text(state),
          ),
        ],
      ),
    );
  }
}

class HomeStateFullExample extends ConsumerStatefulWidget {
  const HomeStateFullExample({super.key});

  @override
  ConsumerState<HomeStateFullExample> createState() =>
      _HomeStateFullExampleState();
}

class _HomeStateFullExampleState extends ConsumerState<HomeStateFullExample> {
  @override
  Widget build(BuildContext context) {
    final name = ref.read(nameProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text('Riverpod Concepts'),
      ),
      body: Center(
        child: Text(name),
      ),
    );
  }
}

class StateNotifierExample extends ConsumerWidget {
  const StateNotifierExample({super.key});
  // updating user state
  void onSubmit(String name, WidgetRef ref) {
    ref.read(userProvider.notifier).updateName(name);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text('Riverpod Concepts'),
      ),
      body: Column(
        children: [
          TextField(
            onSubmitted: (value) {
              onSubmit(value, ref);
            },
          ),
          Center(
            child: Text(user.name),
          ),
          Center(child: Text(user.age.toString()))
        ],
      ),
    );
  }
}
