class QueryReflex < StimulusReflex::Reflex
  def create(query)
    @result = nil
    @query = Query.find_or_create_by!(input: query["query"], language: query["lang"], ip_address: request.remote_ip)
  end

  def show
    @query = Query.find(element["data-query-id"])
    @result = @query.record_for(element["data-result-id"])
  end
end
