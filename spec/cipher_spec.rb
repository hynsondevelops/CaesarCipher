require 'spec_helper'

describe '#caesar_cipher' do 
	it "Encrypts message using a Caesar Cipher" do
		expect(caesar_cipher("What a string!", 5)).to match("Bmfy f xywnsl!")
	end
	it "Works with special characters" do
		expect(caesar_cipher("Hi Hello 1$@%#", 26)).to match("Hi Hello 1$@%#")
	end
end
