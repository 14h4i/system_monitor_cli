library system_monitor_cli;

import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:process_run/process_run.dart';

part 'server.dart';

Future<void> main(List<String> args) async {
  if (args.isNotEmpty) {
    final command = args[0];
    final shell = Shell();

    switch (command) {
      case 'start':
        final host = args.contains('--host')
            ? args[args.indexOf('--host') + 1]
            : 'localhost';
        final port =
            args.contains('--port') ? args[args.indexOf('--port') + 1] : '8765';

        _start(shell, host, port);

        break;

      case 'stop':
        _stop(shell);
        break;

      default:
        print('Invalid command. Use "start" or "stop".');
        break;
    }
  } else {
    print('Usage: system_monitor_cli <command>');
    print('Available commands: start, stop');
  }
}

void _start(Shell shell, String host, String port) {
  final serverPath = _createServer(host, port);

  print("Starting System Monitor Server...");
  shell.run("python3 $serverPath --host $host --port $port");
}

void _stop(Shell shell) {
  final tempFilePath = path.join(Directory.systemTemp.path, nameFileServer);

  print("Stopping System Monitor Server...");
  shell.run("pkill -f python3 $tempFilePath");
}

String _createServer(String host, String port) {
  final tempFilePath = path.join(Directory.systemTemp.path, nameFileServer);
  final tempFile = File(tempFilePath);

  if (!tempFile.existsSync()) {
    tempFile.writeAsStringSync(serverContent);
  }

  return tempFilePath;
}
