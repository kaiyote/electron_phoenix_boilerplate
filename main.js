let { app, BrowserWindow } = require('electron')
let { spawn, spawnSync } = require('child_process')

let mainWindow = null
let devMode = process.env.NODE_ENV === 'development'

let command = 'iex'
let args = ['--sname', 'electron', '-S', 'mix', 'phoenix.server']

if (process.platform === 'win32') {
  args.unshift('/d', '/s', '/c', command)
  command = process.env.comspec || 'cmd.exe'
}

let phoenix = spawn(command, args, { cwd: __dirname })

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') app.quit()
})

app.on('quit', () => {
  // windows needs to run `taskkill` since it actually spawns cmd and tells that to spawn iex
  // it also needs to run it synchronously so it actually kills before electron quits
  if (process.platform === 'win32') spawnSync('taskkill', ['/pid', phoenix.pid, '/f', '/t'])
  else phoenix.kill()
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
