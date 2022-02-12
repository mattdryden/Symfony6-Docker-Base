# Symfony 6 Project with mailcatcher etc and demo service and fixtures

## To get up and running via Docker

## Requirements
- Docker

1) Clone repo to folder

```bash
./helper docker:build
./helper docker:up
```

2) Wait for everything to initialise and then visit http://localhost:3000/

3) Run install

```bash
./helper composer:install
```

4) If any entities
```bash
./helper symfony:migrate
./helper symfony:fixtures
```