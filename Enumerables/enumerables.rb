class Array
    def my_each(&prc)
        i = 0 
        while i < self.length 
            prc.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&prc)
        select = []
        self.my_each { |ele| select << ele if prc.call(ele)}
        select    
    end

    def my_reject(&prc)
        rejects = []
        self.my_each { |ele| rejects << ele if !prc.call(ele) }
        rejects
    end

    def my_any?(&prc)
        self.my_each { |ele| return true if prc.call(ele) }
        false
    end

    def my_all?(&prc)
        self.my_each { |ele| return false if !prc.call(ele) }
        true
    end


    def my_flatten

    end


    def my_zip(*args)
        length = self.length
        arr = [self]
        args.each { |a| arr << row_filler(a, length) }
        arr.transpose
    end

    def row_filler(arr, length)
        if length > arr.length
            while arr.length < length 
                arr << nil
            end
        else
            while arr.length > length 
                arr.pop
            end
        end
        arr 
    end

    
    def my_rotate(num=1)
        if num > 0 
            num.times do
                ele = self.shift
                self << ele
            end
        else
            (-num).times do 
                el = self.pop
                self.unshift(el)
            end
        end
        self
    end


    def my_join(seperator="")
        self.join(seperator)
    end


    def my_reverse
        self.reverse
    end



end





#MY ENUMERABLES
# a = [1, 2, 3]
# p a.my_each { |ele| puts ele } # 1, 2, 3   [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

#MY FLATTEN
#[1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

#MY ZIP
# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]
# 
# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

#MY ROTATE
# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

#MY JOIN
# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

#MY REVERSE
# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]
