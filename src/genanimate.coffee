phantom = require 'phantom'
path = require 'path'
fs = require 'fs.extra'
mkdirp = require 'mkdirp'

ANIMATE_HTML_SUFFIX = '.html'
ANIMATE_HTML_ACTION_SUFFIX = '_edgeActions.html'

### Example
genanimate = require 'genanimate'
genanimate.genanimate
  animate_dir: 'assets/animate'
  src: ['test']
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
  to = path.join path.resolve('.'), config.images_gen_path
  mkdirp to, (e) =>
    if e then console.error(err)
    fs.copyRecursive from, to, callback

scrapeAnimate = (config, target, callback = ->) ->
  animate_target =
    if path.existsSync(path.join(path.resolve(config.animate_dir), target+ANIMATE_HTML_SUFFIX))
      path.join(path.resolve(config.animate_dir), target+ANIMATE_HTML_SUFFIX)
    else
      path.join(path.resolve(config.animate_dir), target+ANIMATE_HTML_ACTION_SUFFIX)

  loadAndExec 'file://'+animate_target
  , (-> $('#Stage').html())
  , (ph, result) ->
    ph.exit()
    result = result.replace 'file://'+path.resolve(config.animate_dir), '/'
    to = path.join path.resolve(config.html_gen_path), target+'.html'
    fs.writeFileSync to, result
    console.log 'file generate:', to, result[0..10], '...'
    callback(result)

executeTask = (config, callback = ->) ->
  copyToGenFromRoot config, ->
    config.src = if config.src?.length then config.src else [config.src]
    config.src.forEach (s) ->
      scrapeAnimate config, s, (result) ->
        callback?()

exports.genanimate
module.exports =
  genanimate: executeTask
