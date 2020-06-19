desc "Require environment"
task :environment do
  require './config/environment'
end

desc "Update boolean values to integers"
task :update_boolean => :environment do
  User.where("admin = 't'").update_all(admin: 1)
  User.where("admin = 'f'").update_all(admin: 0)
end
