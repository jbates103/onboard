# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'parser/app_details_parser'
require 'parser/app_parser'

if File.exists?("#{Rails.root}/files/sso_apps.csv")
  AppParser.new("#{Rails.root}/files/sso_apps.csv").populate_apps
end


if File.exists?("#{Rails.root}/files/sso_apps_detail.csv")
  AppDetailsParser.new("#{Rails.root}/files/sso_apps_detail.csv").populate_apps
end

