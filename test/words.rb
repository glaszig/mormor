require_relative '../lib/mormor'

{
  polish: %w[antywzorców bobów ludziach],
  russian: %w[людских],
  ukrainian: %w[чоловічим солов'їна п'яним],
  swedish: %w[andra omstritt kämpa],
  portuguese: %w[cachorrinho],
  french: %w[parlions],
  german: %w[abbehalten]
}.each do |lang, words|
  dic = MorMor::Dictionary.new(File.expand_path(lang.to_s, __dir__))
  if "utf8" == dic.instance_variable_get(:@encoding)
    dic.instance_variable_set :@encoding, Encoding::UTF_8
  end
  puts "#{lang}\n" + "-" * lang.length
  words.each do |word|
    found = dic.lookup(word)
    puts "#{word}:\n  #{found&.map(&:inspect)&.join("\n  ") || 'NOT FOUND'}"
  end
  puts
end