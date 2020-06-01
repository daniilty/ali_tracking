require 'httparty'
require 'nokogiri'

class Info

  attr_accessor :page
  
  def initialize(addr)
    if addr.nil?
      puts "Please gimme your track number"
      return
    else
      doc = HTTParty.get("https://gdeposylka.ru/courier/china-ems/tracking/" + addr)
      @page = Nokogiri::HTML(doc)
    end
   end
   def prin()
     @page.xpath('//ul[@class = "checkpoints"]/li').each do |el|
      puts el.text
     end
   end

end
print("Enter the tracking number: ")
inf = gets
inst = Info.new(inf.slice(..-2))
inst.prin
