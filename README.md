# Genanimate

Genanimate is generator static html from adobe animate project(.an)

## Installl

```
npm install genanimate
```

## How to use

```coffeescript
require 'genanimate'
config =
  animate_dir: 'assets/edge_animate'
  src: ['test']
  dist: 'gen'
  html_path: 'gen'
  images_path: 'gen/images'
executeTask config
# => 
```

## TODO
- grunt tasknize
- Add test
