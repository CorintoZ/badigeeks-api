require 'httparty'

query = { 
  "page"     => "3",
  "bounds"     => {"ne":{"lat":41.4695761,"lng":2.2280099},"sw":{"lat":41.320004,"lng":2.0695258}}
}
headers = { 
  "authorization"  => " Bearer cb01be126a7034f1921f07f8747252cf5c124148dd2dd0b8837378249c43c955"
}

response = HTTParty.post(
  "https://api.badiapp.com/v1/search/rooms", 
  :query => query,
  :headers => headers
)

body = JSON.parse(response.body)

file = File.open("roomsIds.txt", "w")

body.length.times do |item|
  file.puts body[item]["id"]
end
file.close

#Se guarda los datos especificos de la respuesta para la primera Habitación[0]
#file = File.open("some_file.txt", "w")
#file.puts body[0]["id"]
#file.puts body[0]["description"]
#file.puts body[0]["latitude"]
#file.puts body[0]["longitude"]
#file.close