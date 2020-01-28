module RequestSpecHelper
  #parse JSON response
  def json
    JSON.parse(response.body)
  end

  def calculate_age(birth_date)
    now = Time.now.utc.to_date
    birthday = birth_date.to_date
    now.year - birthday.year - (birthday.change(:year => now.year) > now ? 1 : 0)
  end
end
