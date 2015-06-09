desc "Deploy to heroku"
task :deploy  do
  sh 'git push heroku master'
end