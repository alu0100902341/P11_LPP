# create a Struct with :value, :next and :prev
Nodo = Struct.new(:value, :next, :prev) do

end

class Lista

include Enumerable
include Comparable
attr_accessor :head, :tail, :size

  def initialize	
	@head = nil
	@tail = nil
	@size = 0
  end

  def is_empty?

	if (@head == nil)
		return true
	else
		return false
	end

  end

  def push_back(val)
	
	@size += 1
	if (is_empty?)
		@head = Nodo.new(val, nil, nil)
		@tail = @head
	else

		@tail.next = Nodo.new(val, nil, @tail)
		@tail = @tail.next

	end

  end

  def pop_front
	

	@size -= 1
	if (!is_empty?)
		value = @head.value
		@head = @head.next
		@head.prev = nil
		return value
	end

  end

  def pop

	@size -= 1
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

  def [](key)

	if (key == 0)
		return head.value
	elsif key == size
		return tail.value
	end

	aux = @head	
	for i in 0..key-1
		aux = aux.next		
	end

	return aux.value
	
  end

  def []=(key,val)

	if (key == 0)
		head.value = val
	elsif key == size
		tail.value = val
	end

	aux = @head	
	for i in 0..key-1
		aux = aux.next		
	end

	aux.value = val

  end

  def <=>(other)

	comparison = 0
	aux1 = self.head
	aux2 = other.head
	for i in 0..size-1
		comparison = aux1.value <=> aux2.value
		if comparison == 0
			aux1 = aux1.next
			aux2 = aux2.next
		else
			break
		end
	end
	
	return comparison

  end

end

