phantom = require 'phantom'
path = require 'path'
fs = require 'fs.extra'
mkdirp = require 'mkdirp'

ANIMATE_HTML_SUFFIX = '_edgeActions.html'

### Example
genanimate = require 'genanimate'
genanimate.genanimate
  animate_dir: 'assets/animate'
  src: ['test']
  dist: 'gen'
  html_gen_path: 'gen'
  images_gen_path: 'gen/images'
executeTask config
###

# String * Function * String -> ()
loadAndExec = (url, execCode, callback = ->) ->
  phantom.create (ph) ->
    ph.createPage (page) ->
      page.open url, (status) ->
        setTimeout (-> page.evaluate execCode, (result)-> callback ph, result), 100

copyToGenFromRoot = (config, callback = ->) ->
  from = path.join path.resolve(config.animate_dir), 'images'
  to = path.join path.resolve('.'), config.images_path

  mkdirp to, (e) =>
    if err then console.error(err)
    fs.copyRecursive from, to, callback

scrapeAnimate = (config, target, callback = ->) ->
  animate_target = 'file://' + path.join(path.resolve(config.animate_dir), "#{target}_edgeActions.html")
  loadAndExec animate_target
  , (-> $('#Stage').html())
  , (ph, result) ->
    ph.exit()
    to = path.join path.resolve(config.dist), config.html_path+'.html'
    fs.writeFileSync to, result
    callback(result)

executeTask = (config, callback = ->) ->
  copyToGenFromRoot config, ->
    console.log 'copy assets'
    config.src = if config.src?.length then config.src else [config.src]
    config.src.forEach (s) ->
      scrapeAnimate config, s, (result) ->
        console.log 'done', s
        callback?()

exports.genanimate
module.exports =
  genanimate: executeTask
