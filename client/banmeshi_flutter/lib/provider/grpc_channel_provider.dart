import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_web.dart' as grpc_web;
import 'package:hooks_riverpod/hooks_riverpod.dart';

final grpcChannelProvider = Provider.autoDispose((ref) {
  final channel = (kIsWeb)
      ? grpc_web.GrpcWebClientChannel.xhr(Uri(
          host: 'localhost',
          port: 8080,
        ))
      : ClientChannel(
          'localhost',
          port: 8080,
          options: const ChannelOptions(
            credentials: ChannelCredentials.insecure(),
          ),
        );

  ref.onDispose(() {
    channel.shutdown();
  });
  return channel;
});
