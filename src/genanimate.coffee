phantom = require 'phantom'
path = require 'path'
fs = require 'fs.extra'
mkdirp = require 'mkdirp'

ANIMATE_HTML_SUFFIX = '_edgeActions.html'

### Example
require 'genanimate'
config =
  animate_dir: 'assets/edge_animate'
  src: ['test']
  dist: 'gen'
  html_path: 'gen'
  images_path: 'gen/images'
executeTask config
###

# String * Function * String -> ()
loadAndExec = (url, execCode, callback) ->
  phantom.create (ph) ->
    ph.createPage (page) ->
      page.open url, (status) ->
        setTimeout (-> page.evaluate execCode, (result)-> callback ph, result), 100

copyToGenFromRoot = (config, callback) ->
  console.log config.animate_dir
  from = path.join path.resolve(config.animate_dir), 'images'
  to = path.join path.resolve('.'), config.images_path
  console.log from, to
scrapeAnimate = (config, target, callback) ->
  animate_target = 'file://' + path.join(path.resolve(config.animate_dir), "#{target}_edgeActions.html")
  loadAndExec animate_target
  , (-> $('#Stage').html())
  , (ph, result) ->
    ph.exit()
    to = path.join path.resolve(config.dist), config.html_path+'.html'
    fs.writeFileSync to, result
    callback(result)

executeTask = (config, callback) ->
  copyToGenFromRoot(config)
  config.src = if config.src?.length then config.src else [config.src]
  config.src.forEach (s) ->
    scrapeAnimate config, s, (result) ->
      console.log result

exports.genanimate
module.exports =
  genanimate: executeTask
