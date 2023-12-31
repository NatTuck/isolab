import Config

config :isolabd,
  host_token: "earwax"

import_config "#{config_env()}.exs"
