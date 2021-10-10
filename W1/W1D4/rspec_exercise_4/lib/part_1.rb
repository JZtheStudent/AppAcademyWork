
def my_reject(arr, &prc)
    res = []
    arr.each { |ele| res << ele if !prc.call(ele) }
    res
end

def my_one?(arr, &prc)
    count = 0
    arr.each { |ele| count += 1 if prc.call(ele) }
    count == 1
end

def hash_select(h, &prc)
    res = Hash.new()
    h.each { |k, v| res[k] = v if prc.call(k, v) }
    res 
end

def xor_select(arr, prc1, prc2)
    res = []
    arr.each do |ele|
        res << ele if !(prc1.call(ele) && prc2.call(ele)) && (prc1.call(ele) || prc2.call(ele))
    end 
    res
end

def proc_count(v, arr)
    count = 0
    arr.each { |prc| count += 1 if prc.call(v)}
    count
end