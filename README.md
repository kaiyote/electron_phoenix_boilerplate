# ElectronPhoenixBoilerplate

### What is this?
This is a project that lets you use elixir, via phoenix and electron, to write a desktop app.

### Why?
Pretty UI + business logic in Elixir........, why not?

### Should you be doing this?
Should anybody be doing anything? Should you use this in a real, production-y setting? Probably not? But then again, maybe you should? Who knows?

## Getting Setup
  1. Make sure [Elixir](http://elixir-lang.org/install.html), [Phoenix](https://hexdocs.pm/phoenix/installation.html), and [NodeJS](https://nodejs.org/en/) are installed. The versions this app was bootstrapped with are as follows:
     - Elixir: 1.12.3
     - Phoenix: 1.6.2
     - NodeJS: 17.1.0 (npm 8.1.0)
  2. Update all your local elixir tooling: `$ mix do local.hex, local.phx`
  3. Install the elixir dependencies: `$ mix setup`
  4. Install the node dependencies: `$ npm i`
  5. Fire up `phx.server` once on its own, just to be sure it's all ready to go: `$ mix phx.server` (you can shut it down after it starts up successfully)

## Running / Development
  1. Run `$ npm start` to start the `electron` shell. In this project, `electron` handles firing up the `phoenix` elixir node
  2. In a separate shell, run `$ iex --sname YOUR_SHELL_NAME --remsh electron@YOUR_MACHINE_NAME` to connect to the node that `electron` started

## TODO
  - [x] Have `electron` spawn and kill an erlang node running `iex -S mix phx.server`
  - [x] Make Ye Ol' Standard Counter Example app
  - [x] Make the counter be one of them there fancy new `LiveViews` from fancy new Phoenix
  - [ ] Write some dang tests, gosh darn it
  - [ ] Produce a `production` build of the phoenix stuff
  - [ ] Make a final `electron` asar (probably with unpacked stuff for the `elixir` assets)
