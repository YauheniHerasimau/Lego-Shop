ActiveRecord::Base.connection_handler.connection_pool_list.each do |pool|
  pool.disconnect!
  pool.flush!
end

ActiveRecord::Base.establish_connection
