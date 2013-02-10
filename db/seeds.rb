# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require "csv"

ROOT_CSV = "db/seed_data"
PATTERN = "*.csv"

ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
    next if table == 'schema_migrations'

    #MySQL and PostgreSQL
    ActiveRecord::Base.connection.execute("TRUNCATE #{table}")
end

table_arr = ["CountryArea.csv", "Country.csv"]

Dir.chdir(ROOT_CSV)
#Dir.glob(PATTERN) do |f|
table_arr.each do |f|
  print "running #{f}...\n"
  flag_first = true
  table_str = f.slice(0, f.length - 4)
  table_cls = eval "#{table_str}"
  p "for table: #{table_str}"

  table_cls.delete_all
  param_arr = []
  CSV.foreach("#{f}", encoding: "Shift_JIS:UTF-8") do |row|
    if flag_first == true
      # シンボルに変換する
      param_arr = row.collect {|v| p "v = "+v.to_str; v.to_sym}

      flag_first = false
      next
    end

    param_buf = [param_arr, row].transpose
    param_hash = Hash[*param_buf.flatten]
    if param_hash.key?(:password_digest)
      p "column password_digest matched\n"
      param_hash[:password_digest] = BCrypt::Password.create(param_hash[:password_digest])
    end

    # 画像の場合はCarrierWaveでアップロード
    param_hash.each do |param_name, param_value|
      if /\.(jpg|png|gif|jpeg|ico)$/ =~ param_value.to_s
        p "image attached:"+param_name.to_s
        param_hash[param_name] = File.open(File.join(Rails.root,"app", "assets", "images", param_value))
      end
    end

    begin
      table_cls.create(param_hash)
    rescue Exception => e
      p e.message
    end
  end
end

