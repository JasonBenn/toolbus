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

Tool.pluck(:id).each do |tool_id|
  rand(35..150).times do
    Mission.create(
      name: [Faker::Hacker.adjective, Faker::Hacker.noun, Faker::Hacker.verb, Faker::Hacker.ingverb].sample(rand(3) + 2).join(' ').capitalize,
      summary: Array.new(rand(3) + 1, Faker::Hacker.say_something_smart).join(' '),
      found_in: Array.new(rand(2) + 1, Faker::Hacker.abbreviation),
      documentation_url: Faker::Internet.url,
      version_added: rand(3),
      version_removed: rand(10) + 3,
      tool_id: tool_id
    )
  end
end

User.pluck(:id).each do |user_id|
  rand(1..5).times do
    Repo.create(
      user_id: user_id,
      name: [Faker::Hacker.adjective, Faker::Hacker.noun, Faker::Hacker.verb, Faker::Hacker.ingverb].sample(rand(2) + rand(3)).join('_')
    )
  end
end

mission_count = Mission.count
tool_count = Tool.count
user_count = User.count
repo_count = Repo.count

mission_count.times do
  mission_id = rand(mission_count) + 1
  line_start = rand(100)
  
  [0, 0, 0, 1, 3, 5, 2].sample.times do 
    Completion.create(
      commit: Faker::Internet.password,
      filename: 'app/models/example.rb',
      gist_url: Faker::Internet.url('github.com'),
      line_start: line_start,
      line_end: line_start + rand(5),
      repo_id: rand(repo_count) + 1,
      mission_id: mission_id
    )
  end
end

User.pluck(:id).each do |user_id|
  ToolsUsers.create(
    tool_id: rand(tool_count) + 1,
    user_id: user_id
  )

  ToolsUsers.create(
    tool_id: rand(tool_count) + 1,
    user_id: user_id
  )
end

Repo.pluck(:id).each do |repo_id|
  ReposTools.create(
    tool_id: rand(tool_count) + 1,
    repo_id: repo_id
  )
end

Repo.pluck(:id).each do |repo_id|
  ReposUsers.create(
    repo_id: repo_id,
    user_id: rand(user_count) + 1
  )
end