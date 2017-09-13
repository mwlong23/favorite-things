#!/usr/bin/env ruby

require 'rspec'
require 'item'
require 'pry'

describe('Item') do
  before() do
    Item.clear
  end

  describe('.all') do
    it "is empty at first" do
      expect(Item.all()).to(eq([]))
    end
  end

  describe('#save') do
    it "saves an item to the list of items" do
      item = Item.new('tacos')
      item.save()
      expect(Item.all()).to(eq([item]))
      binding.pry
    end
  end
  
  describe(".clear") do
    it "clears all items from the list" do
      item = Item.new("tacos")
      item.save
      Item.clear
      expect(Item.all).to(eq([]))
    end
  end
end
