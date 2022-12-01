defmodule MarkoWeb.SetSessionId do
  @moduledoc """
  """

  @cookie "_marko_cookie"
  @cookie_opts [sign: true, max_age: 60 * 60 * 24 * 60, same_site: "Lax"]

  import Plug.Conn

  alias Marko.Token

  def init(opts), do: opts

  def call(conn, _opts) do
    conn = fetch_cookies(conn, signed: [@cookie])

    if id = conn.cookies[@cookie] do
      put_session(conn, :id, id)
    else
      id = Token.generate()

      conn
      |> put_resp_cookie(@cookie, id, @cookie_opts)
      |> put_session(:id, id)
    end
  end
end
