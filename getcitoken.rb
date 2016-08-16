#!/usr/bin/env ruby

# getcitoken - retrieves gitlab-ci token for configuration of runners
# Damien Garros, inspired from Sam McLeod - https://github.com/sammcj/getcitoken

require 'mechanize'
require 'logger'

gitlab_ci_url = ENV['GITLAB_URL']
gitlab_usermame = ENV['GITLAB_USERNAME']
gitlab_password = ENV['GITLAB_PASSWORD']

agent = Mechanize.new
agent.log = Logger.new "getcitoken.log"

login_page = agent.get gitlab_ci_url+"/users/sign_in"
login_form = login_page.form

email_field = login_form.field_with(name: "user[login]")
password_field = login_form.field_with(name: "user[password]")

email_field.value = gitlab_usermame
password_field.value = gitlab_password

home_page = login_form.submit
runner_page = agent.get agent.get gitlab_ci_url+"/admin/runners"

# Return Token
runner_page.search('code').each do |results|
  puts runner_page.parser.xpath('//code/text()').to_html
end
