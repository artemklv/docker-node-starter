# Starter configuration for nodejs frontend and backend project

## requirements

- docker
- docker compose plugin
- make tool

## Commands

- **build all containers** (need to run fist project cloned)

```sh
  make build
```

- **run all containers**

```sh
  make start
```

- **stop all containers**

```sh
  make stop
```

- **see logs from specific container**

```sh
  make log s=[service name in docker-compose.yml e.g. frontend, backend]
```

- **attach shell**

```sh
  make sh s=[service name]
```

- **run command inside container** (useful for container project setup)

```sh
  make run s=[service] c="[shell command]"
```
