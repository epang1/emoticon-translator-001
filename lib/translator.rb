# require modules here
require "yaml"
require 'pry'

def load_library(file_path)
translator = {}
 translator = YAML.load_file(file_path)
 new_hash = {"get_meaning" => {}, "get_emoticon" => {}}
 translator.each do |mood, emojis|
  new_hash["get_meaning"][emojis[1]] = mood
  new_hash["get_emoticon"][emojis[0]] = emojis[1]

  end
return new_hash
end

def get_japanese_emoticon(file_path, western)
  translator = load_library(file_path)
  translated = ""
  translator["get_emoticon"].each do |key, value|
    if key == western
      translated = value
    end
  end
  if translated == ""
    return "Sorry, that emoticon was not found"
  else
    return translated
  end
end

def get_english_meaning(file_path, japanese)
translator = load_library(file_path)
translated = ""
translator["get_meaning"].each do |emoji, mood|
  if japanese == emoji
    translated = mood
  end
end

if translated == ""
  return "Sorry, that emoticon was not found"
else
  return translated
end
end