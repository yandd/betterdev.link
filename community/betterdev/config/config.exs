# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :betterdev,
  ecto_repos: [Betterdev.Repo]

# Configures the endpoint
config :betterdev, Betterdev.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Bk0U+ypmzC6sTKW/FXYdWr1FFR6sCTIB0H3hH3fXj29o+S1/ZaK8ifBmCBfz39p6",
  render_errors: [view: Betterdev.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Betterdev.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :betterdev, :auth0,
  app_baseurl: System.get_env("AUTH0_BASEURL"),
  app_id: System.get_env("AUTH0_APP_ID"),
  app_secret: "AUTH0_APP_SECRET"
    |> System.get_env
    # We only need this if it's base64
    #|> Kernel.||("")
    #|> Base.url_decode64
    #|> elem(1)

config :exbot,
  token: "TELEGRAM_BOT_TOKEN" |> System.get_env

config :kerosene,
  theme: :bootstrap4

  #config :exq,
  #  name: Exq,
  #  host: "127.0.0.1",
  #  port: 6379,
  #  namespace: "exq",
  #  concurrency: :infinite,
  #  queues: ["default", "criticl", "low"],
  #  poll_timeout: 50,
  #  scheduler_poll_timeout: 200,
  #  scheduler_enable: true,
  #  max_retries: 25,
  #  shutdown_timeout: 5000
  #
  #config :exq_ui,
  #  web_port: 4040,
  #  web_namespace: "",
  #  server: true

config :tirexs, :uri, "http://127.0.0.1:9200"

config :new_relic,
  application_name: System.get_env("NEWRELIC_APP_NAME"),
  license_key: System.get_env("NEWRELIC_LICENSE_KEY"),
  poll_interval: 10_000

config :slack,
  client_id: System.get_env("SLACK_CLIENT_ID"),
  client_secret: System.get_env("SLACK_CLIENT_SECRET"),
  client_token: System.get_env("SLACK_CLIENT_TOKEN")
