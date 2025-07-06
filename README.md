# Tunnels
 - [Website](https://tunnels.is)
 - [License](https://github.com/tunnels-is/tunnels/blob/main/LICENSE)
 - [Discord]( https://discord.gg/7Ts3PCnCd9)
 - [Live Development](https://twitch.tv/keyb1nd_)

# Requirements
### Client Web UI
 - vite
### Client Golang App
 - golang (macos: ifconfig, route), (windows: netsh)
### Server (supports linux and docker)
 - iptables (only needed when running the server)
 - golang

# Starting the golang client
NOTE: The client requires sudo/admin on windows and mac, but only narrow net admin permission on linux.
```bash
$ cd ./cmd/main
$ go build .
$ ./main
```

# Starting the web UI
NOTE: when opening the dev ui, you must first accept the TLS certificate on port 7777 (https://127.0.0.1:7777)
```bash
$ cd ./frontend
$ pnpm install .
$ vite dev 
```

# Starting the server
```bash
$ cd ./server
$ go build .
fresh run: $ ./server --config 
$ ./server
```

# Notes about development
We accept any code, even from machine learning models
as long as the code makes sense, even small spellfixing
contributions. Just remember to run the linter before submitting.

# Random development / deployment information
### iptables for the server
these are applied automatically on startup
```
$ iptables -I OUTPUT -p tcp --src {interface_IP} --tcp-flags ACK,RST RST -j DROP
```
### Linting
```
$ golangci-lint run --timeout=10m --config .golangci.yml
```
### Permissions
 - Windows: admin
 - macos: sudo
 - linux: setcap 'cap_net_raw,cap_net_bind_service,cap_net_admin+eip' main

## Building
 - DEV: ./releaser-build-snapshot.sh
 - PROD: ./releaser-build-release.sh ( requires GITHUB_TOKEN )

# Experimental
## Wails
We are experimenting with a wails GUI, it will output it's build into the `build` directory.  

# Special mentiones
These are the real MVPs:

    - n00bady: creator of bluam https://github.com/n00bady/bluam
    - 0xMALVEE: for major contributiosn to the front-end
    - keyb1nd_'s twitch chat for the backseat debugging and support!
    - comahacks for security reviews
    - klauspost for development advice

[forks-shield]: https://img.shields.io/github/forks/tunnels-is/tunnels?style=for-the-badge&logo=github
[forks-url]: https://github.com/tunnels-is/tunnels/network/members
[stars-shield]: https://img.shields.io/github/stars/tunnels-is/tunnels?style=for-the-badge&logo=github
[stars-url]: https://github.com/tunnels-is/tunnels/stargazers
[issues-shield]: https://img.shields.io/github/issues/tunnels-is/tunnels?style=for-the-badge&logo=github
[issues-url]: https://github.com/tunnels-is/tunnels/issues
