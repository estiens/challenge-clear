class QueryReflex < StimulusReflex::Reflex
  def create(query, language = "ruby")
    puts query
    puts language
    @query = query
    @language = language
    @results = []
    query.length.times do
      @results << "foo"
    end
  end
end
