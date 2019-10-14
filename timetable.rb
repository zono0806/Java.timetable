require 'nokogiri'
require 'open-uri'

url = 'https://www.hankyu.co.jp/railinfo/'

charset = nil
html = open(url) do |f|
    charset = f.charset
    f.read
end

doc = Nokogiri::HTML.parse(html, nil, charset)
doc.xpath('//div[@id="contents"]').each do |node|
    node.xpath('//div[@class="common_styles article"]').each do |nodeset|
        puts nodeset.xpath('//div[@class="all_route"]/p').text
    end
end

