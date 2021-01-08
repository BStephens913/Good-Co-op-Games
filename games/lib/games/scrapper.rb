require 'nokogiri'
require 'open-uri'
require 'pry'


class Games::Scrapper

    attr_accessor :title, :description, :content

    def self.games
        game = []
        game << self.game_1
        game << self.game_2
        game << self.game_3
        game << self.game_4
        game << self.game_5
        game
    end

    def self.game_1
        doc = Nokogiri::HTML(open("https://store.playstation.com/en-us/product/UP0082-CUSA10938_00-SHADOWTOMBRAIDER"))
        game = self.new
        game.title = doc.search("h1").text.split('RaiderShadow').uniq.join(' ').split.uniq.join(' ')
        game.description = doc.search("p").text
        game.content = doc.css("#main > div.psw-grid-container.pdp-content > div.top-content-full > div > div.psw-cell.psw-tablet-l-7.psw-tablet-p-12.pdp-content-right > div > div.content-rating-container.psw-p-t-2xl.psw-cell.psw-desktop-5.psw-tablet-l-12.psw-tablet-p-6.psw-mobile-p-12 > div > div > div > div > div > span:nth-child(1)").text
        game
    end

    def self.game_2
        doc = Nokogiri::HTML(open("https://store.playstation.com/en-us/product/UP9000-CUSA00223_00-SECONDSONSHIP000"))
        game = self.new
        game.title = doc.search("h1").text.split('SoninFAMOUS').uniq.join(" ").split.uniq.join(" ")
        game.description = doc.search("p").text
        game.content = doc.search("#main > div.psw-grid-container.pdp-content > div.top-content-full > div > div.psw-cell.psw-tablet-l-7.psw-tablet-p-12.pdp-content-right > div > div.content-rating-container.psw-p-t-2xl.psw-cell.psw-desktop-5.psw-tablet-l-12.psw-tablet-p-6.psw-mobile-p-12 > div > div > div > div > div > span").text
        game
    end

    def self.game_3
        doc = Nokogiri::HTML(open("https://store.playstation.com/en-us/product/UP1003-CUSA05333_00-SKYRIMHDFULLGAME"))
        game = self.new
        game.title = doc.search("h1").text.split('EditionThe').uniq.join(" ").split.uniq.join(" ")
        game.description = doc.search("p").text
        game.content = doc.search("#main > div.psw-grid-container.pdp-content > div.top-content-full > div > div.psw-cell.psw-tablet-l-7.psw-tablet-p-12.pdp-content-right > div > div.content-rating-container.psw-p-t-2xl.psw-cell.psw-desktop-5.psw-tablet-l-12.psw-tablet-p-6.psw-mobile-p-12 > div > div > div > div > div > span").text
        game
    end

    def self.game_4
        doc = Nokogiri::HTML(open("https://store.playstation.com/en-us/product/UP1001-CUSA01401_00-BORDERLANDSHDCOL"))
        game = self.new
        game.title = doc.search("h1").text.split('CollectionBorderlands:').uniq.join(" ").split.uniq.join(" ")
        game.description = doc.search("p").text
        game.content = doc.search("#main > div.psw-grid-container.pdp-content > div.top-content-full > div > div.psw-cell.psw-tablet-l-7.psw-tablet-p-12.pdp-content-right > div > div.content-rating-container.psw-p-t-2xl.psw-cell.psw-desktop-5.psw-tablet-l-12.psw-tablet-p-6.psw-mobile-p-12 > div > div > div > div > div > span").text
        game
    end

    def self.game_5
        doc = Nokogiri::HTML(open("https://store.playstation.com/en-us/product/UP5245-CUSA13529_00-SUBNAUTICA000000"))
        game = self.new
        name = doc.search("h1").text.scan /\w/
        game.title = name.uniq.join("")
        game.description = doc.search("p").text
        game.content = doc.search("#main > div.psw-grid-container.pdp-content > div.top-content-full > div > div.psw-cell.psw-tablet-l-7.psw-tablet-p-12.pdp-content-right > div > div.content-rating-container.psw-p-t-2xl.psw-cell.psw-desktop-5.psw-tablet-l-12.psw-tablet-p-6.psw-mobile-p-12 > div > div > div > div > div > span:nth-child(1)").text
        game
    end
end
