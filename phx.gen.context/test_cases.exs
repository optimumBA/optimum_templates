  import <%= inspect context.module %>Fixtures

  alias <%= inspect context.module %>

  @invalid_attrs <%= Mix.Phoenix.to_text for {key, _} <- schema.params.create, into: %{}, do: {key, nil} %>

  describe "list_<%= schema.plural %>/0" do
    test "returns all <%= schema.plural %>" do
      <%= schema.singular %> = <%= schema.singular %>_fixture()
      assert <%= inspect context.alias %>.list_<%= schema.plural %>() == [<%= schema.singular %>]
    end
  end

  describe "get_<%= schema.singular %>!/1" do
    test "returns the <%= schema.singular %> with given id" do
      <%= schema.singular %> = <%= schema.singular %>_fixture()
      assert <%= inspect context.alias %>.get_<%= schema.singular %>!(<%= schema.singular %>.id) == <%= schema.singular %>
    end
  end

  describe "create_<%= schema.singular %>/1" do
    test "with valid data creates a <%= schema.singular %>" do
      valid_attrs = <%= Mix.Phoenix.to_text schema.params.create %>

      assert {:ok, %<%=  inspect context.alias %>.<%= inspect schema.alias %>{} = <%= schema.singular %>} = <%= inspect context.alias %>.create_<%= schema.singular %>(valid_attrs)<%= for {field, value} <- schema.params.create do %>
      assert <%= schema.singular %>.<%= field %> == <%= Mix.Phoenix.Schema.value(schema, field, value) %><% end %>
    end

    test "with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = <%= inspect context.alias %>.create_<%= schema.singular %>(@invalid_attrs)
    end
  end

  describe "update_<%= schema.singular %>/2" do
    test "with valid data updates the <%= schema.singular %>" do
      <%= schema.singular %> = <%= schema.singular %>_fixture()
      update_attrs = <%= Mix.Phoenix.to_text schema.params.update%>

      assert {:ok, %<%=  inspect context.alias %>.<%= inspect schema.alias %>{} = <%= schema.singular %>} = <%= inspect context.alias %>.update_<%= schema.singular %>(<%= schema.singular %>, update_attrs)<%= for {field, value} <- schema.params.update do %>
      assert <%= schema.singular %>.<%= field %> == <%= Mix.Phoenix.Schema.value(schema, field, value) %><% end %>
    end

    test "with invalid data returns error changeset" do
      <%= schema.singular %> = <%= schema.singular %>_fixture()
      assert {:error, %Ecto.Changeset{}} = <%= inspect context.alias %>.update_<%= schema.singular %>(<%= schema.singular %>, @invalid_attrs)
      assert <%= schema.singular %> == <%= inspect context.alias %>.get_<%= schema.singular %>!(<%= schema.singular %>.id)
    end
  end

  describe "delete_<%= schema.singular %>/1" do
    test "deletes the <%= schema.singular %>" do
      <%= schema.singular %> = <%= schema.singular %>_fixture()
      assert {:ok, %<%=  inspect context.alias %>.<%= inspect schema.alias %>{}} = <%= inspect context.alias %>.delete_<%= schema.singular %>(<%= schema.singular %>)
      assert_raise Ecto.NoResultsError, fn -> <%= inspect context.alias %>.get_<%= schema.singular %>!(<%= schema.singular %>.id) end
    end
  end

  describe "change_<%= schema.singular %>/1" do
    test "returns a <%= schema.singular %> changeset" do
      <%= schema.singular %> = <%= schema.singular %>_fixture()
      assert %Ecto.Changeset{} = <%= inspect context.alias %>.change_<%= schema.singular %>(<%= schema.singular %>)
    end
  end
