def average(num1, num2)
    (num1 + num2) / 2.0
end 

def average_array(arr)
    arr.sum / (arr.length * 1.0) 
end

def repeat(str, num)
    str * num
end 

def yell(str) 
    str.upcase + "!"
end 

def alternating_case(str)
    wordArr = str.split
    (0...wordArr.length).each do |i|
        if i.even? then wordArr[i].upcase! else wordArr[i].downcase!
        end
    end
    wordArr.join(" ")
end 

