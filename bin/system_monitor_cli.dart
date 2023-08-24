library system_monitor_cli;

import 'package:process_run/process_run.dart';

Future<void> main(List<String> args) async {
  if (args.isNotEmpty) {
    final command = args[0];
    final shell = Shell();

    if (command == 'start') {
      final host = args.contains('--host')
          ? args[args.indexOf('--host') + 1]
          : 'localhost';
      final port =
          args.contains('--port') ? args[args.indexOf('--port') + 1] : '8765';

      print("Starting System Monitor Server...");
      await shell.run("python3 server.py --host $host --port $port");
    } else if (command == 'stop') {
      print("Stopping System Monitor Server...");
      await shell.run("pkill -f python server.py");
    } else {
      print('Invalid command. Use "start" or "stop".');
    }
  } else {
    print('Usage: system_monitor_cli <command>');
    print('Available commands: start, stop');
  }
}
