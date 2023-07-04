import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pafee_app/presentation/router/router.dart';

void main() {
  // HapticFeedback.heavyImpact();
  runApp(ProviderScope(
    child: MaterialApp(home: MyApp()),
  ));
}
