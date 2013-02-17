# -*- coding: utf-8 -*-
#### TEST_APPにアプリ名を登録 ####
set :application, "TEST_APP_STAGING"

# RVM
#### rvmのパス 環境に合わせて変更　####
#set :rvm_path, '~/.rvm'
#set :rvm_bin_path, "#{rvm_path}/bin"
#set :rvm_lib_path, "#{rvm_path}/lib"

# デプロイ先のフォルダ設定
#### デプロイ先のフォルダを設定　####
set :deploy_to, "/var/www/fs_bbs/"
#### デプロイする環境名をセット　####
set :rails_env, "staging"

# デプロイ先のサーバの設定
server "107.23.232.95:10022", :app, :web, :db, :primary => true

# Bundle
set :bundle_flags, ""

# SSHユーザの設定
#### USER_NAME, USER_GROUP, PASSWORD, KEYのパス, パスフレーズ、SSHのポート
set :user, "ec2-user"
set :user_group, "wheel"
set :password, ""
ssh_options[:keys] = %w(~/.ssh/nindart-staging.pem)
ssh_options[:passphrase] = ""
ssh_options[:port] = "10022"

namespace :deploy do
  #### Wheneverを使っていない場合は削除 ####
#  desc "wheneverのアップデート"
#  task :whenever_update do
#    run "cd #{latest_release} && RAILS_ENV=#{rails_env} bundle exec whenever --update-crontab #{application} -f config/schedule_#{rails_env}.rb"
#  end

  #### Powを使っていない場合は削除(環境に合わせて適宜変更) ####
#  desc "Powの環境変数をセット"
#  task :set_powenv, :roles => :web do
#    run "cd #{latest_release} && echo 'export RAILS_ENV=#{rails_env} > .powenv'"
#  end
#  desc "Powリンクセット"
#  task :set_link, :roles => :web do
#    run "rm -rf /Users/#{user}/.pow/{application} && powder link"
#  end
end
after :deploy, "deploy:set_link"
after :deploy, "deploy:set_powenv"
after :deploy, 'deploy:whenever_update'
