# timofei-bazhukov-portfolio

[![ABAP2UI5 Tests](https://github.com/BazhukovTima/timofei-bazhukov-portfolio/actions/workflows/test_abap2ui5.yml/badge.svg)](https://github.com/BazhukovTima/timofei-bazhukov-portfolio/actions/workflows/test_abap2ui5.yml)
[![Flutter Tests](https://github.com/BazhukovTima/timofei-bazhukov-portfolio/actions/workflows/test_flutter.yml/badge.svg)](https://github.com/BazhukovTima/timofei-bazhukov-portfolio/actions/workflows/test_flutter.yml)
[![React Tests](https://github.com/BazhukovTima/timofei-bazhukov-portfolio/actions/workflows/test_react.yml/badge.svg)](https://github.com/BazhukovTima/timofei-bazhukov-portfolio/actions/workflows/test_react.yml)
[![SAPUI5 Tests](https://github.com/BazhukovTima/timofei-bazhukov-portfolio/actions/workflows/test_sapui5.yml/badge.svg)](https://github.com/BazhukovTima/timofei-bazhukov-portfolio/actions/workflows/test_sapui5.yml)

[![Deploy to ghp](https://github.com/BazhukovTima/timofei-bazhukov-portfolio/actions/workflows/deploy.yml/badge.svg)](https://github.com/BazhukovTima/timofei-bazhukov-portfolio/actions/workflows/deploy.yml)

## Getting started

### Start local
``` 
Create `.env.development.local` file with content:
PUBLIC_URL=/
``` 
``` 
npm run start 
```

### Deploy to github pages

Run with deploy action on push to main

### abap2ui5 standalone

#### Start local (express server)
```
npm run abap:start:local
```
#### Start local (webpack)
```
npm run abap:start:webpack
```


### Flutter standalone

#### Start local (express server)
```
npm run flutter:start
```


### Tests

```
npm run test
```