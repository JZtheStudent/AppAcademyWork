
def element_count(arr)
    h = Hash.new(0)
    arr.each { |ele| h[ele] += 1 }
    h
end 

def char_replace!(str, h)
    (0...str.length).each do |i|
        if h.include?(str[i])
            str[i] = h[str[i]]
        end 
    end
    str
end

def product_inject(arr)
    arr.inject(1) { |acc, ele| acc * ele}
end