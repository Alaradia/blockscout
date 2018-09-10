defmodule BlockScoutWeb.ViewingTokensTest do
  use BlockScoutWeb.FeatureCase, async: true

  alias BlockScoutWeb.TokenPage

  describe "viewing token overview" do
    test "have a link to the contract_address", %{session: session} do
      token = insert(:token)

      session
      |> TokenPage.visit_page(token.contract_address_hash)
      |> assert_has(TokenPage.token_contract_address())
    end
  end
end
