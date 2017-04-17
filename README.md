# ElectronPhoenixBoilerplate
### What is this?
This is a project that lets you use elixir, via phoenix and electron, to write a desktop app.
### Why?
Pretty UI + business logic in Elixir........, why not?
### Should you be doing this?
Should anybody be doing anything? Should you use this in a real, production-y setting? Probably not? But then again, maybe you should? Who knows?

## Getting Setup
  1. Make sure Elixir and Erlang are installed (this app was written using 1.4.2 and 19.3 on Windows)
  2. Make sure [Phoenix is installed](http://www.phoenixframework.org/docs/installation).
  3. Update all your local elixir tooling: `$ mix do local.hex, local.rebar, local.phoenix`
  4. Install the elixir dependencies: `$ mix do deps.get, deps.compile, dialyzer --plt`
  5. Install the node dependencies: `$ yarn` or `$ npm install`
  6. Fire up `phoenix.server` once on its own, just to be sure it's all ready to go: `$ iex -S mix phoenix.server` (you can shut it down after it starts up successfully)

## Running / Development
  1. Run `$ yarn start` or `$ npm start` to start the `electron` shell. In this project, `electron` handles firing up the `phoenix` elixir node
  2. In a separate shell, run `$ iex --sname YOUR_SHELL_NAME --remsh electron@YOUR_MACHINE_NAME` to connect to the node that `electron` started

## TODO
  - [x] Have `electron` spawn and kill an erlang node running `iex -S mix phoenix.server`
  - [ ] Switch the elixir project to an umbrella project so that business logic can be fully separate from UI stuff
  - [ ] Use `distillery` to produce a `production` build
  - [ ] Make a final `electron` asar (probably with unpacked stuff for the `elixir` assets)

## Learn more
  * Phoenix official website: http://www.phoenixframework.org/
  * Phoenix guides: http://phoenixframework.org/docs/overview
  * Phoenix docs: https://hexdocs.pm/phoenix
  * Phoenix mailing list: http://groups.google.com/group/phoenix-talk
  * Phoenix source: https://github.com/phoenixframework/phoenix
  * Credo: https://github.com/rrrene/credo
  * Dialyxir: https://github.com/jeremyjh/dialyxir
  * Dialyzer: http://erlang.org/doc/man/dialyzer.html
