class QueryReflex < StimulusReflex::Reflex
  def create(query, language = "ruby")
    return unless query.length >= 3

    @query = Query.find_or_create_by(input: query, language: language, ip_address: request.remote_ip)
  end
end
