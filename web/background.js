
chrome.app.runtime.onLaunched.addListener(function(launchData) {
  chrome.app.window.create('chromeapp_copy_paste_test.html', {
    'id': '_mainWindow', 'bounds': {'width': 800, 'height': 600 }
  });
});
