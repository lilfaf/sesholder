require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks


namespace :test do
  task :deploy do
    sh 'vagrant up'
    sh 'ansible-playbook -i hosts --limit development config/deploy/main.yml'
  end
end

task :deploy do
  sh 'ansible-playbook -i hosts --limit production config/deploy/main.yml'
end
