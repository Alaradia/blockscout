defmodule BlockScoutWeb.TokenPage do
  @moduledoc false

  use Wallaby.DSL
  import Wallaby.Query, only: [css: 1]
  alias Explorer.Chain.{Address}

  def visit_page(session, %Address{hash: address_hash}) do
    visit_page(session, address_hash)
  end

  def visit_page(session, contract_address_hash) do
    visit(session, "tokens/#{contract_address_hash}")
  end

  def token_contract_address do
    css("[data-test='token_contract_address']")
  end
end
