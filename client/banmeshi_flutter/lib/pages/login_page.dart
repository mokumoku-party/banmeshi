import 'package:banmeshi_flutter/model/user_controller.dart';
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
      Future.microtask(() => ref.read(userProvider.notifier).login());
      return;
    }, const []);

    useEffect(() {
      void listener() {
        isValidState.value = textController.text.isNotEmpty;
      }

      textController.addListener(listener);

      return () => textController.removeListener(listener);
    }, [textController.text]);

    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: screenSize.width * .6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: const InputDecoration(hintText: 'なまえ'),
                controller: textController,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: FilledButton(
                  onPressed: textController.text.isNotEmpty
                      ? () {
                          ref
                              .read(userProvider.notifier)
                              .register(textController.text);
                        }
                      : null,
                  child: const Text(
                    'ログイン',
                    style: TextStyle(fontSize: 32),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
