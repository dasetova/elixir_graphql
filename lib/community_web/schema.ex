defmodule CommunityWeb.Schema do
  use Absinthe.Schema

  alias CommunityWeb.NewsResolver

  object :link do
    field(:id, non_null(:id))
    field(:url, non_null(:string))
    field(:description, non_null(:string))
  end

  # This is the action
  query do
    # This is an action option
    field :all_links, non_null(list_of(non_null(:link))) do
      # Function who resolves the call
      resolve(&NewsResolver.all_links/3)
    end
  end

  # This is where all mutations goes
  mutation do
    # Each field goes in the response
    field :create_link, :link do
      # Each arg is received from front
      arg(:url, non_null(:string))
      arg(:description, non_null(:string))
      # Function whos resolve this request
      resolve(&NewsResolver.create_link/3)
    end
  end
end
