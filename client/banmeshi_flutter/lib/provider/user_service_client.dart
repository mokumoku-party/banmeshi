import 'package:banmeshi_flutter/gen/proto/service/user_service.pbgrpc.dart';
import 'package:banmeshi_flutter/provider/grpc_channel_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userServiceProvider = Provider.autoDispose<UserServiceClient>((ref) {
  final channel = ref.watch(grpcChannelProvider);

  return UserServiceClient(channel);
});
