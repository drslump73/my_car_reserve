require 'capybara/poltergeist'

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, {:js_errors => false, :timeout => 5000 })
end

session = Capybara::Session.new(:poltergeist)

session.driver.headers = {
    'User-Agent' => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2564.97 Safari/537.36"
}
session.visit "http://114.179.81.154/scripts/mtr0010.asp"

session.fill_in('mt0010uid', :with => '161234')
session.fill_in('mt0010pwd', :with => '1234')
session.find(:xpath, "/html/body/div/form/input").click

session.find(:xpath, '//*[@id="form1"]/table/tbody/tr[1]/td[1]/input').click

html = session.html
doc = Nokogiri::HTML.parse(html)

table1 = doc.xpath("/html/body/div[1]/form[1]/table[2]/tbody")
content = table1.to_html

puts content

if content =~ /kusya/
  puts "empty found!!"
  `msg drslump73 empty!!`
  exit
end

# next button
session.find(:xpath, "/html/body/div[1]/form[1]/table[1]/tbody/tr[3]/td[3]/input").click

html = session.html
doc = Nokogiri::HTML.parse(html)

table2 = doc.xpath("/html/body/div[1]/form[1]/table[2]/tbody")
content = table2.to_html

puts content

if content =~ /kusya/
  puts "empty found!!"
  `msg drslump73 empty!!`
  exit
end

# next button
session.find(:xpath, "/html/body/div[1]/form[1]/table[1]/tbody/tr[3]/td[3]/input").click

html = session.html
doc = Nokogiri::HTML.parse(html)

table3 = doc.xpath("/html/body/div[1]/form[1]/table[2]/tbody")
content = table3.to_html

puts content

if content =~ /kusya/
  puts "empty found!!"
  `msg drslump73 empty!!`
  exit
end

# logout
session.find(:xpath, "/html/body/div[1]/form[2]/input").click
