defmodule <%= inspect schema.module %> do
  @moduledoc false

  use Ecto.Schema

  import Ecto.Changeset

  @type attrs :: map()
  @type changeset :: Ecto.Changeset.t()
  @type t :: %__MODULE__{}
<%= if schema.prefix do %>
  @schema_prefix :<%= schema.prefix %>
<% end %><%= if schema.binary_id do %>
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
<% end %>
  schema <%= inspect schema.table %> do
<%= Mix.Phoenix.Schema.format_fields_for_schema(schema) %>
<%= for {k, _, assoc_schema_name, _} <- schema.assocs do %>    belongs_to <%= inspect k %>, <%= assoc_schema_name |> String.split(".") |> Enum.take(-1) |> Module.concat() |> inspect() %>
<% end %>
    timestamps(<%= if schema.timestamp_type != :naive_datetime, do: "type: #{inspect schema.timestamp_type}" %>)
  end

  @spec changeset(t(), attrs()) :: changeset()
  def changeset(<%= schema.singular %>, attrs) do
    <%= schema.singular %>
    |> cast(attrs, [<%= Enum.map_join(schema.attrs, ", ", &inspect(elem(&1, 0))) %>])
    |> validate_required([<%= Enum.map_join(Mix.Phoenix.Schema.required_fields(schema), ", ", &inspect(elem(&1, 0))) %>])
<%= for k <- schema.uniques do %>    |> unique_constraint(<%= inspect k %>)
<% end %>  end
end
