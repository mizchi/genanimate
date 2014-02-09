# Genanimate

Genanimate is generator static html from adobe animate project(.an)

## Installl

```
npm install genanimate
```

## How to use

```coffeescript
genanimate = require 'genanimate'
genanimate.genanimate
  animate_dir: 'assets/animate'
  src: ['test']
  html_gen_path: 'gen'
  images_gen_path: 'gen/images'
```

## TODO
- grunt tasknize
- Add test
