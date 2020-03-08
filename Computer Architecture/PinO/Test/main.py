import eel
eel.init('web')

# Do the same with an inline callback
eel.js_random()(lambda n: print('Got this  Javascript:', n))

eel.start('main.html', size=(400, 300))
