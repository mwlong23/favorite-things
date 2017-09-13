#!/usr/bin/env ruby

class Item
  @@list = []

  attr_reader :id
  attr_accessor :name , :rank

  def initialize(name, rank)
    @name = name
    @rank = rank
    @id = @@list.length + 1
  end

  def self.all
    @@list.sort {|item1, item2| item1.rank <=> item2.rank}

  end

  def save
    @@list.push(self)
  end

  def self.clear
    @@list = []
  end

  def self.find(id)
    item_id = id.to_i
    @@list.each do |item|
      if item.id == item_id
        return item
      end
    end
  end
end
