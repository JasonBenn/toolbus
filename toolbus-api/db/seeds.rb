User.create(
  username: 'JasonBenn',
  image_url: 'https://avatars1.githubusercontent.com/u/2539761?v=3&s=460'
)

5.times do |n|
  User.create(
    username: Faker::Internet.user_name,
    image_url: Faker::Avatar.image
  )
end

primary_colors = { 
  "Ember.js" => "dc4331",
  "Rails" => "a62326",
  "Ruby" => "ea4648",
  "Python" => "28bd52",
  "CSS" => "1b7ef8",
  "JavaScript" => "edd551"
}

secondary_colors = {
  "Ruby" => "ffffff"
}

["Rails", "Ember.js", "CSS", "Python", "HTML", "JavaScript", "Ruby"].each do |tool|
  Tool.create(
    name: tool.capitalize,
    primary_color: primary_colors[tool],
    secondary_color: secondary_colors[tool] || 'fff',
    description: Faker::Lorem.paragraph(2),
    url: Faker::Internet.url
  )
end

Tool.all.each do |tool|
  rand(35..150).times do
    Achievement.create(
      name: [Faker::Hacker.adjective, Faker::Hacker.noun, Faker::Hacker.verb, Faker::Hacker.ingverb].sample(rand(3) + 2).join(' ').capitalize,
      summary: Array.new(rand(3) + 1, Faker::Hacker.say_something_smart).join(' '),
      found_in: Array.new(rand(2) + 1, Faker::Hacker.abbreviation),
      documentation_url: Faker::Internet.url,
      version_added: rand(3),
      version_removed: rand(10) + 3,
      tool_id: tool.id
    )
  end
end