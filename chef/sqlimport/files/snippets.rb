
  if platform?('windows')
   puts 'Oh, it is windows!'
  end
  
  #iterate over the enet dbusers
  node['enetgas'].each do |key, value|
    unless value.empty?
          puts "#{key} #{value}"
     end 
   end    
 