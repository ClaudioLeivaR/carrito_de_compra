
    desc "reload the database with seed data"
    task :semilla do
        exec("cd #{current_path}; rails db:seed RAILS_ENV=production")
    end

    after "deploy:migrating", "semilla"

