defmodule Wh40ktoeWeb.PageController do
  use Wh40ktoeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
