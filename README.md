# Symfony 6 Project with mailcatcher etc and demo service and fixtures

## To get up and running via Docker

## Requirements
- Node >= 14
- Docker

1) Clone repo to folder

```bash
npm install
npm run build
npm run docker:build
npm run docker:up
```

2) Wait for everything to initialise and then visit http://localhost:3000/

3) Run install & migration

```bash
npm run symfony:install
```

4) If any entities
```bash
npm run symfony:migrate
npm run symfony:fixtures
```