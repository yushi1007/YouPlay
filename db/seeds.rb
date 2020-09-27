require 'pry'
require 'rest-client'
require 'json'
require_relative '../config/environment'
Video.destroy_all

api_key = "AIzaSyBuVA_lzCCxno3CnOYXp3LQRJb7tgoc8ZU"

# query = ["Ruby+on+Rails", "Java+Programming","JavaScript+ES6","Reactjs+Tutorial","Nodejs+Tutorial", "Expressjs+Tutorial", "Laravel+Tutorial", "PHP+Tutorial", "Bootstrap+CSS+Tutorial","Vanilla+CSS+Tutorial"]

@youtube1 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=ruby+tutorial&key='+"#{api_key}")
@youtube2 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=Java+Programming+Tutorial&key='+"#{api_key}")
@youtube3 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=JavaScript+ES6+Tutorial&key='+"#{api_key}")
@youtube4 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=Reactjs+Tutorial&key='+"#{api_key}")
@youtube5 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=Nodejs+Tutorial&key='+"#{api_key}")
@youtube6 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=Expressjs+Tutorial&key='+"#{api_key}")
@youtube7 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=Laravel+Tutorial&key='+"#{api_key}")
@youtube8 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=PHP+Tutorial&key='+"#{api_key}")
@youtube9 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=Bootstrap+CSS+Tutorial&key='+"#{api_key}")
@youtube10 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=Vanilla+CSS+Tutorial&key='+"#{api_key}")

@yt1 = JSON.parse(@youtube1)
# binding.pry
@yt2 = JSON.parse(@youtube2)
@yt3 = JSON.parse(@youtube3)
@yt4 = JSON.parse(@youtube4)
@yt5 = JSON.parse(@youtube5)
@yt6 = JSON.parse(@youtube6)
@yt7 = JSON.parse(@youtube7)
@yt8 = JSON.parse(@youtube8)
@yt9 = JSON.parse(@youtube9)
@yt10 = JSON.parse(@youtube10)

@yt_array = [@yt1, @yt2, @yt3, @yt4, @yt5, @yt6, @yt7, @yt8, @yt9, @yt10]

j=0
@yt_array.each do |array|
category_names = ["Ruby on Rails", "Java", "JavaScript", "React", "Node", "Express", "Laravel", "PHP", "Bootstrap", "CSS"]
        i=0
        50.times do
            Video.create(video_id: array["items"][i]["id"]["videoId"], title: array["items"][i]["snippet"]["title"], thumbnail_url: array["items"][i]["snippet"]["thumbnails"]["medium"]["url"], category: category_names[j])
        i+=1
        end
    j+=1
end
