def pipeline(*funcs)
 -> (args){
 	# Pass on the arg and return answer and call next funcs
 	answer = ''
 	funcs.each { |function| 
 		if (answer != '')
 			answer = function.call(answer)
 		else
 			answer = function.call(args)
 		end
 	}
 	return answer
 }
end
fun = pipeline(-> (x) { x * 3 }, -> (x) { x + 1 }, -> (x) { x / 2 })
puts (fun.call(3))


class IceCream

	attr_accessor :dipped, :flavour, :scoops, :logged

	def initialize(dipped, flavour, scoops, logged: ->(a,b,c) { })
		@dipped = dipped
		@flavour = flavour
		@scoops = scoops
		@logged = logged
	end

	def is_my_cone_awesome?()
		logged.call(@flavour, @scoops, @dipped)
	end

end

log_for_icecream = ->(flavour,scoops,dipped) { "This is a great icecream because #{dipped}, i got #{scoops} scoop(s) and it tastes like #{flavour}!"}

ic = IceCream.new('I am dipped', 'grape', 1, logged: log_for_icecream)

p ic.is_my_cone_awesome?

dc = IceCream.new('I am double dipped', 'grape', 1)
p dc.is_my_cone_awesome?
