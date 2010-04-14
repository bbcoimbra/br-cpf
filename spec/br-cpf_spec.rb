require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe BR::CPF do

  context "when Fixnum" do

    it "should return true for valid cpfs" do
      VALID_CPFS_INTEGER.each do |valid_cpf|
        BR::CPF.valid?(valid_cpf).should be_true
      end
    end

    it "should return false for invalid cpfs" do
      INVALID_CPFS_INTEGER.each do |invalid_cpf|
        BR::CPF.valid?(invalid_cpf).should be_false
      end
    end

  end

  context "when String" do

    it "should return true for valid cpfs" do
      VALID_CPFS_STRING.each do |valid_cpf|
        BR::CPF.valid?(valid_cpf).should be_true
      end
    end

    it "should return false for invalid cpfs" do
      INVALID_CPFS_STRING.each do |invalid_cpf|
        BR::CPF.valid?(invalid_cpf).should be_false
      end
    end

  end

end
