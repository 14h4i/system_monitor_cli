# system_monitor_cli

A command-line interface (CLI) for controlling the System Monitor server, which is part of the System Monitor package.

## Description

The **system_monitor_cli** package provides a command-line interface to start and stop the System Monitor server, which is a component of the [system_monitor](https://pub.dev/packages/system_monitor) package. The server allows you to monitor system metrics using WebSocket communication.

## Installation

Install the package globally using Dart's package manager:

```sh
dart pub global activate system_monitor_cli
```

## Usage
### Start the Server
To start the System Monitor server, use the following command:

```sh
dart pub global run system_monitor_cli --start --host <host> --port <port>
```

Replace `<host>` with the desired hostname or IP address, and `<port>` with the desired port number.

### Stop the Server
To stop the running System Monitor server, use the following command:

```sh
dart pub global run system_monitor_cli --stop
```

## Contributing
Contributions are welcome! Feel free to open issues and submit pull requests.

## License
This package is licensed under the MIT License - see the [LICENSE](https://github.com/14h4i/system_monitor_cli/blob/main/LICENSE) file for details.
