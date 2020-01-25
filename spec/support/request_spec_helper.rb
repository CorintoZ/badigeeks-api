module RequestSpecHelper
  #parse JSON response
  def json
    JSON.parse(response.body)
  end
end
