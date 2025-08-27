# frozen_string_literal: true

require 'active_support/core_ext/object/blank'
require 'active_support/core_ext/string/inflections'

require_relative 'color_swatch_collection/version'

require_relative 'color_swatch_collection/basic'
require_relative 'color_swatch_collection/html'
require_relative 'color_swatch_collection/ntc'
require_relative 'color_swatch_collection/pantone'
require_relative 'color_swatch_collection/roygbiv'
require_relative 'color_swatch_collection/x11'

require_relative 'color_swatch_collection/tailwind/tailwind_v1'
require_relative 'color_swatch_collection/tailwind/tailwind_v2'
require_relative 'color_swatch_collection/tailwind/tailwind_v3'
require_relative 'color_swatch_collection/tailwind/tailwind_v4'

module ColorSwatchCollection
  class Error < StandardError; end

  def self.list_collections
    ['basic', 'html', 'ntc', 'pantone', 'roygbiv', 'x11', 'tailwind_v1', 'tailwind_v2', 'tailwind_v3', 'tailwind_v4']
  end

  def self.get_from_hex(colour_hex, pick: [], omit: [])
    found_colour = nil

    self.list_collections.each do |list_name|
      next unless (pick.empty? || pick.include?(list_name)) && !omit.include?(list_name)

      found_colour = self.get_item_from_collection(colour_hex, 'hex', list_name)

      if found_colour.present?
        found_colour[:collection] = list_name
        break
      end
    end

    found_colour || {}
  end

  def self.get_from_name(colour_name, pick: [], omit: [])
    found_colour = nil

    self.list_collections.each do |list_name|
      next unless (pick.empty? || pick.include?(list_name)) && !omit.include?(list_name)

      found_colour = self.get_item_from_collection(colour_name, 'name', list_name)

      if found_colour.present?
        found_colour[:collection] = list_name
        break
      end
    end

    found_colour || {}
  end

  def self.get_colours(pick: [], omit: [])
    self.list_collections.collect do |list_name|
      next unless (pick.empty? || pick.include?(list_name)) && !omit.include?(list_name)

      Object.const_get("ColorSwatchCollection::#{list_name.classify}").colours.collect do |swatch_hash|
        swatch_hash[:collection] = list_name
        swatch_hash
      end
    end.compact.flatten
  end

  private

  def self.get_item_from_collection(colour_input, input_type, list_name)
    return nil if colour_input.blank?

    swatch_hash = nil
    list_collection_object = Object.const_get("ColorSwatchCollection::#{list_name.classify}")

    if input_type == 'hex'
      swatch_hash = list_collection_object.colours.find { |swatch| swatch[:hex] == colour_input.upcase }
    elsif input_type == 'name'
      if ['ntc', 'pantone'].include?(list_name)
        swatch_hash = list_collection_object.colours.find { |swatch| swatch[:name] == colour_input.downcase.strip }
      else
        swatch_hash = list_collection_object.colours.find { |swatch| swatch[:name] == colour_input.downcase.gsub(' ', '') }
      end
    end

    swatch_hash || {}
  end
end
