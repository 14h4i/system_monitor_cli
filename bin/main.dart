library system_monitor_cli;

import 'package:args/args.dart';
import 'package:process_run/process_run.dart';

Future<void> main(List<String> args) async {
  final parser = ArgParser()
    ..addFlag('start', abbr: 's', help: 'Start the server')
    ..addFlag('stop', abbr: 't', help: 'Stop the server')
    ..addOption('host', abbr: 'h', help: 'Host for the server')
    ..addOption('port', abbr: 'p', help: 'Port for the server');

  final results = parser.parse(args);

  final host = results['host'] ?? 'localhost';
  final port = int.tryParse(results['port'] ?? '8765') ?? 8765;

  if (results['start']) {
    await startServer(host, port);
  } else if (results['stop']) {
    stopServer();
  } else {
    print('Invalid command. Use "--start" or "--stop".');
  }
}

Future<void> startServer(String host, int port) async {
  final shell = Shell();

  print("Starting System Monitor Server...");

  await shell.run("python3 server.py --host $host --port $port");
}

Future<void> stopServer() async {
  final shell = Shell();

  print("Stopping System Monitor Server...");

  await shell.run("pkill -f python server.py");
}
