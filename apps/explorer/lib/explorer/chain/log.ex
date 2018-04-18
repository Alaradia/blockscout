defmodule Explorer.Chain.Log do
  @moduledoc "Captures a Web3 log entry generated by a transaction"

  use Explorer.Schema

  alias Explorer.Chain.{Address, Receipt}

  @required_attrs ~w(address_id data index type)a
  @optional_attrs ~w(
    first_topic second_topic third_topic fourth_topic
  )a

  schema "logs" do
    field(:data, :string)
    field(:first_topic, :string)
    field(:fourth_topic, :string)
    field(:index, :integer)
    field(:second_topic, :string)
    field(:third_topic, :string)
    field(:type, :string)

    timestamps()

    belongs_to(:address, Address)
    belongs_to(:receipt, Receipt)
    has_one(:transaction, through: [:receipt, :transaction])
  end

  def changeset(%__MODULE__{} = log, attrs \\ %{}) do
    log
    |> cast(attrs, @required_attrs)
    |> cast(attrs, @optional_attrs)
    |> cast_assoc(:address)
    |> cast_assoc(:receipt)
    |> validate_required(@required_attrs)
  end
end