class Scraper

  def self.scrape_metacritic
    doc = Nokogiri::HTML(open("http://www.metacritic.com/browse/games/release-date/coming-soon/switch/date",
    ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE, 'User-Agent' => 'safari'))
    games = []
    doc.css('div.product_wrap').text.each do |game|
      name = game.css('div.product_title').text
      release_date = game.css('li.stat.release_date').text
      games << {name: name, release_date: release_date}
    end
    games
  end

  end
  end
  def self.scrape_index_page(index_url)
    html = open(index_url)
    students = []
     doc = Nokogiri::HTML(html)
     doc.css(".student-card a").each do |student|
         name = student.css(".student-name").text
         location = student.css(".student-location").text
         profile_url = student.attr("href")
         students << {name: name, location: location, profile_url: profile_url}
     end
     students
   end

  def self.scrape_profile_page(profile_url)
html = open(profile_url)
student = {}
profile_page = Nokogiri::HTML(html)
links = profile_page.css("div.social-icon-container a").each do |icons|
if icons.attr("href").include?("linkedin")
  student[:linkedin] = icons.attr("href")
elsif icons.attr("href").include?("github")
  student[:github] = icons.attr("href")
elsif icons.attr("href").include?("twitter")
  student[:twitter] = icons.attr("href")
else
  student[:blog] = icons.attr("href")
end
end
student[:profile_quote] = profile_page.css(".profile-quote").text if profile_page.css(".profile-quote")
student[:bio] = profile_page.css("div.description-holder p").text if profile_page.css("div.description-holder p")
student
end

end
