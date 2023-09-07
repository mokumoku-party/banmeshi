import 'package:grpc/grpc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final grpcChannelProvider = Provider.autoDispose((ref) {
  final channel = ClientChannel(
    'localhost',
    port: 50051,
    options: const ChannelOptions(
      credentials: ChannelCredentials.insecure(),
    ),
  );

  ref.onDispose(() {
    channel.shutdown();
  });
  return channel;
});
