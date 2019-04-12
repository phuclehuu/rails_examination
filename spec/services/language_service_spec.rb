require 'rails_helper'
describe LanguageService do
  describe "#search" do
  	it "language no one speaks" do
  		language_no_one_speaks = Language.create(code: 'ru')
  		language = Language.create(code: 'vn')
  		Guide.create(email: 'john@example.com', language_ids:[language.id])
        searchResults = LanguageService.new.get_unused_languages
        expect(searchResults).to eq [language_no_one_speaks]
    end
  end
end