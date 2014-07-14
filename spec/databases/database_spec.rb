require './spec_helper'

shared_examples 'a database' do

  let(:db) { described_class.new }

  describe "honks" do
    it "persists and gets" do
      honk = Honkr::Honk.new(nil, 75, "beep!")
      db.persist_honk(honk)
      expect(honk.id).to_not be_nil

      retrieved_honk = db.get_honk(honk.id)
      expect(retrieved_honk.content).to eq "beep!"
    end
  end

  describe "users" do
    it "persists and gets" do
      user = Honkr::User.new(nil, "bob", "digest")
      db.persist_user(user)
      expect(user.id).to_not be_nil

      retrieved_user = db.get_user(user.id)
      expect(retrieved_user.username).to eq "bob"
      expect(user.password_digest).to eq "digest"
    end
  end

end

describe Honkr::Databases::InMemory do
  it_behaves_like 'a database'
end

describe Honkr::Databases::SQL do
  it_behaves_like 'a database'
end
