
def reverser(str, &prc)
    str = str.reverse 
    prc.call(str)
end

def word_changer(str, &prc)
    res = []
    str.split.each { |ele| res << prc.call(ele)}
    res.join(" ")
end

def greater_proc_value(num, prc1, prc2)
    res1 = prc1.call(num)
    res2 = prc2.call(num)
    return res1 if res1 > res2
    res2
end

def and_selector(arr, prc1, prc2)
    arr = arr.select { |ele| prc1.call(ele) }
    arr.select { |ele| prc2.call(ele) }
end

def alternating_mapper(arr, prc1, prc2)
    (0...arr.length).each do |i|
        if i.even? 
            arr[i] = prc1.call(arr[i])
        else 
            arr[i] = prc2.call(arr[i])
        end
    end 
    arr

end