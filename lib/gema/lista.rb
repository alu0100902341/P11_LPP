# create a Struct with :value, :next and :prev
Nodo = Struct.new(:value, :next, :prev) do

end

class Lista

include Enumerable
attr_accessor :head, :tail

  def initialize	
	@head = nil
	@tail = nil
  end

  def is_empty?

	if (@head == nil)
		return true
	else
		return false
	end

  end

  def push_back(val)

	if (is_empty?)
		@head = Nodo.new(val, nil, nil)
		@tail = @head
	else

		@tail.next = Nodo.new(val, nil, @tail)
		@tail = @tail.next

	end

  end

  def pop_front
	
	if (!is_empty?)
		value = @head.value
		@head = @head.next
		@head.prev = nil
		return value
	end

  end

  def pop

	if (!is_empty?)
		value = @tail.value
		@tail = @tail.prev
		@tail.next = nil
		return value
	end

  end

  def each

  	node = @head
  	while(node!=nil)
        	yield node.value
            	node = node.next
        end

  end



end

