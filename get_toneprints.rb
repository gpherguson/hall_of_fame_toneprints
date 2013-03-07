#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'
require 'uri'

BASE_URI = 'http://www.tcelectronic.com/hall-of-fame-reverb/toneprints/'
TONEPRINT_DMG_DIR = './tone_prints'

File.open('Toneprint_notes.txt', 'w') do |fo|
  fo.puts ['Title', 'Description', 'URL'].join("\t")

  starting_page = Nokogiri::HTML(open(BASE_URI))
  starting_page.search('ul.hall-of-fame-reverb-toneprints li h3 a').each do |a|

    toneprint_url = URI.parse(BASE_URI)
    toneprint_url.path = URI.escape(a['href'])

    doc = Nokogiri::HTML(open(toneprint_url))

    node = doc.at('section#toneprint-description')
    toneprint_title, toneprint_desc = %w[h2 p].map{ |tag| node.at(tag).text }

    node = doc.at('a.file-type-dmg')
    title = node.children.first.text
    dmg_url = node['href']

    print "#{ toneprint_title }... "
    fo.puts [toneprint_title, toneprint_desc, dmg_url].join("\t")

    toneprint_url.path = URI.escape(dmg_url)

    toneprint_file_path = File.basename(dmg_url)
    artist, dmg_filename = File.basename(toneprint_file_path).split(/[_-]/)[-2..-1]
    dmg_dir = File.join(TONEPRINT_DMG_DIR, artist)
    FileUtils.mkdir_p(dmg_dir) # unless Dir.exist?(dmg_dir)

    File.write(File.join(dmg_dir, dmg_filename), open(toneprint_url).read)

    puts "ok"

  end
end
