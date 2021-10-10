require "code"

describe "Code:" do
    describe "test" do
        it "should accept a string as an arg" do 
            expect { test("Hello World")}.to_not raise_error
        end

        context "This is what you put for a certain situation" do 
            it "should return whatever string you passed in" do
                expect(test("Hello World")).to eq ("Hello World")
                expect(test("App Academy is fun")).to eq ("App Academy is fun")
            end 
        end 
    end

    # describe "strange_sums" do
    #     it "should return a count of the number of distinct paris of elements that have a sum of zero" do
    #         expect(strange_sums([2, -3, 3, 4, -2])).to eq(2)
    #         expect(strange_sums([42, 3, -1, -42]).to eq(1)
    #         expect(strange_sums([-5, 5])).to eq(1)
    #         expect(strange_sums([19, 6, -3, -20]) ).to eq(0)
    #         expect(strange_sums([9])).to eq(0)
    #     end 
    # end

end
