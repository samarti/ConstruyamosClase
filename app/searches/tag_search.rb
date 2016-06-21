class TagSearch < Searchlight::Search
  def base_query
    ActsAsTaggableOn::Tag.all
  end

  def search_name_like
    query.where("name ILIKE ?", "%#{name_like}%")
  end

  def search_typeahead
    query.where("name ILIKE ?", "%#{typeahead}%")
  end
end