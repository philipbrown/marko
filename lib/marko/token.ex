defmodule Marko.Token do
  @moduledoc """
  Helper functions for generating a token, and encrypting and decrypting data
  """

  @endpoint MarkoWeb.Endpoint

  @doc """
  Generate a token
  """
  @spec generate :: binary()
  def generate do
    Base.url_encode64(:crypto.strong_rand_bytes(32), padding: false)
  end

  @doc """
  Encodes, encrypts, and signs data into a token you can send to clients.
  """
  @spec encrypt(term()) :: binary()
  def encrypt(data) do
    Phoenix.Token.encrypt(@endpoint, secret(), data)
  end

  @doc """
  Decrypts the original data from the token and verifies its integrity.
  """
  @spec decrypt(binary()) :: term()
  def decrypt(binary) do
    {:ok, data} = Phoenix.Token.decrypt(@endpoint, secret(), binary)

    data
  end

  ###########
  # Private #
  ###########

  defp secret, do: Application.get_env(:marko, @endpoint)[:secret_key_base]
end
