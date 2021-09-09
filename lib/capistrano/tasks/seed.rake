namespace :deploy do
    desc "reload the database with seed data"
    task :semilla do
        on roles(:all) do
            within current_path do
                execute :bundle, :exec,"rails", "db:seed", "RAILS_ENV=production"
            end
        end
    end
end
    after "deploy:migrate", "semilla"

