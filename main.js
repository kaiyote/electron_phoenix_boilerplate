let { app, BrowserWindow } = require('electron')
let cp = require('child_process')

let mainWindow = null
let devMode = process.env.NODE_ENV === 'development'

let phoenix = cp.spawn('iex', ['--sname', 'electron', '-S', 'mix', 'phoenix.server'], {
  cwd: __dirname
})

if (devMode) require('node-debug')

app.on('window-all-closed', () => {
  if (devMode) app.quit()
})

app.on('quit', () => {
  phoenix.kill()
})

app.on('ready', () => {
  mainWindow = new BrowserWindow({
    show: false,
    width: 1024,
    height: 720
  })

  mainWindow.loadURL('http://localhost:4000')

  mainWindow.webContents.on('did-finish-load', () => {
    mainWindow.show()
    mainWindow.focus()
  })

  mainWindow.on('closed', () => {
    mainWindow = null
  })

  if (devMode) mainWindow.openDevTools()
})
