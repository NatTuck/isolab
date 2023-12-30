# Isolab

This application provides a management interface for isolating users
on lab computers from internet access.

Basic design:

 - Each lab computer runs a daemon that keeps an open websocket to the
   central server.
 - When the central server instructs that user internet is disabled,
   the daemon installs a nftables rule that will drop all packets from
   the user account.
 - When internet is re-enabled, the nftables rule is removed.


## Phoenix Dev

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
