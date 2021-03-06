# -*- coding: utf-8 -*-

set :default_stage, "production"

# 複数環境にデプロイできるようにする
require "capistrano/ext/multistage"

# capistranoの出力をカラーに
require 'capistrano_colors'

# cap deploy時に自動で bundle installを実行
require "bundler/capistrano"

# RVM
#require "rvm/capistrano"
##### RVMで利用するRubyのバージョンを設定(1.9.3を変更) ####
#set :rvm_ruby_string, '1.9.3'
#set :rvm_type, :user

# gitリポジトリの設定
#### gitリポジトリをセット ####
set :repository,  "git@github.com:happyspr/fs_bbs.git"
set :scm, :git
set :branch, "master"
set :deploy_via, :remote_cache

# SSH
set :use_sudo, true
set :default_run_options, :pty => true
ssh_options[:forward_agent] = true

set :normalize_asset_timestamps, false
# 過去のデプロイしたフォルダを履歴として保持する数
set :keep_releases, 10

namespace :deploy do
  desc "古いサイトマップの削除"
  task :copy_old_sitemap do
    run "if [ -e #{previous_release}/public/sitemap_index.xml.gz ]; then cp #{previous_release}/public/sitemap* #{current_release}/public/; fi"
  end

  desc "sitemapの更新"
  task :refresh_sitemaps do
    run "cd #{latest_release} && RAILS_ENV=#{rails_env} rake sitemap:refresh"
  end
  # Passengerの実行ユーザー/Groupをセット
  task :set_file_process_owner do
    sudo "chown -R #{user}:#{user_group} #{deploy_to}"
  end
end
before :deploy, "deploy:set_file_process_owner"
after :deploy, "deploy:migrate"

# sitemap
after "deploy:update_code", "deploy:copy_old_sitemap"
after :deploy, "deploy:refresh_sitemaps"
