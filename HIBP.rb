# # # # # # # #
#!/usr/bin/env ruby
# # # # # # #

# # # # # #
# Created November 2th 2017
# Copyright (c) 2017 Beyar.
# # # #

# # #
# Name: hibp.rb
# #

system "clear" or system "cls"

begin
	require "open-uri"
	rescue LoadError
	system "gem install openurl"
end

begin
	require "nokogiri"
	rescue LoadError
	system "gem install nokogiri"
end

white = "\033[0m"
cyan = "\033[0;36m"
purple = "\033[0;35m"
red = "\033[0;31m"

@doc = Nokogiri::HTML(open("https://haveibeenpwned.com/"))
puts "	       #{white}Haveibeenpwned's Top 10"
puts
puts "	           #{purple}Website | Entries"
for x in 0..10
	begin
		puts "#{cyan}#{@doc.css("i.pwnCompanyName")[x].text.center(26)} #{white}| #{red}#{@doc.css("span.pwnCount")[x].text}#{white}"
		rescue NoMethodError
		#do noting
	end
end
