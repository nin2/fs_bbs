# -*- coding: utf-8 -*-
#### TEST_APPにアプリ名を登録 ####
set :application, "fs_bbs"

# RVM
#### rvmのパス 環境に合わせて変更　####
#set :rvm_path, '/usr/local/rvm'
#set :rvm_bin_path, "#{rvm_path}/bin"
#set :rvm_lib_path, "#{rvm_path}/lib"

#### デプロイ先のフォルダを設定　####
set :deploy_to, "/var/www/fs_bbs/"
set :rails_env, "production"

# デプロイ先のサーバの設定
#### デプロイ先のサーバをセット ####
server "107.23.172.167:80", :app, :web, :db, :primary => true

# bundle install条件
set :bundle_flags, "--no-deployment --without test development"

# SSH
#### USER_NAME, USER_GROUP, PASSWORD, KEYのパス, パスフレーズ、SSHのポート
set :user, "ec2-user"
set :user_group, "wheel"
set :password, ""
ssh_options[:keys] = %w(~/.ssh/nindart-key.pem)
ssh_options[:passphrase] = ""
ssh_options[:port] = "10022"

# assets:precompile
namespace :assets do
  task :precompile, :roles => :web do
    run "cd #{current_path} && RAILS_ENV=#{rails_env} bundle exec rake assets:precompile"
  end

  task :cleanup, :roles => :web do
    run "cd #{current_path} && RAILS_ENV=#{rails_env} bundle exec rake assets:clean"
  end
end
after :deploy, "assets:precompile"

namespace :deploy do
  #### sitemap_generatorを使ってない場合は削除 ####
#  desc "sitemapの更新"
#  task :refresh_sitemaps do
#    run "cd #{latest_release} && RAILS_ENV=#{rails_env} bundle exec rake sitemap:refresh"
#  end

  # 本番サーバでPassenger以外を使っている場合は適宜変更して下さい。
  desc "Passenger用に起動/停止タスクを変更"
  task :restart, :roles => :web do
    run "touch #{current_path}/tmp/restart.txt"
  end

  # page_cacheを使用していない場合は不要
#  desc "キャッシュhtmlの削除(deploy中に不完全なhtmlを生成しないための対策)"
#  task :remove_caches, :roles => :web do
#    run "rm -rf #{current_path}/public/index.html"
#  end

  desc "wheneverのアップデート"
  task :whenever_update do
    run "cd #{latest_release} && RAILS_ENV=#{rails_env} bundle exec whenever --update-crontab #{application}"
  end
end
after :deploy, "deploy:migrate"
after :deploy, "deploy:refresh_sitemaps"
after :deploy, "deploy:restart"
after :deploy, "deploy:remove_caches"
after :deploy, 'deploy:whenever_update'
