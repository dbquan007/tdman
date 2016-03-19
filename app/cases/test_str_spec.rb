#encoding: utf-8

describe String do
    it 'should be a string', :str1 do
        str = 'test string'
        expect(str.class.to_s).to eq('string')
    end
end
