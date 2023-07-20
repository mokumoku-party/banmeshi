import 'package:banmeshi_flutter/model/user_controller.dart';
import 'package:banmeshi_flutter/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController();
    final isValidState = useState(false);

    useEffect(() {
      void listener() {
        isValidState.value = textController.text.isNotEmpty;
      }

      textController.addListener(listener);

      return () => textController.removeListener(listener);
    }, [textController.text]);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: const InputDecoration(hintText: 'なまえ'),
            controller: textController,
          ),
          TextButton(
            onPressed: textController.text.isNotEmpty
                ? () {
                    ref.read(userProvider.notifier).create(textController.text);

                    final user = ref.read(userProvider)!;
                    ref.read(userRepository).login(user);
                  }
                : null,
            child: const Text(
              'ログイン',
              style: TextStyle(fontSize: 32),
            ),
          ),
        ],
      ),
    );
  }
}
