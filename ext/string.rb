# cover string to hash
class String
	def str_to_hash
		hash = {}
		return hash if self.empty?
		arr = self.split(',').map { |i| i.strip }
		arr.each do |key|
			hash[key.to_sym] = true 
		end #each
		hash
	end
end

# str = " a,b,  c "
# puts str.str_to_hash

