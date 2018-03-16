require_relative '../../../../lib/mdt/fetchers/git'

RSpec.describe MDT::Fetchers::Git do
  it 'should have the "git" key defined' do
    expect { MDT::Fetchers::Git.key }.not_to raise_error
    expect(MDT::Fetchers::Git.key).to eq 'git'
  end

  it 'should have "repository" subkey' do
    expect { MDT::Fetchers::Git.subkeys }.not_to raise_error
    expect(MDT::Fetchers::Git.subkeys).to eq ['repository']
  end

  describe '#fetch' do
    before(:each) do
      @fetcher = MDT::Fetchers::Git.new
    end
    it 'should not raise error' do
      expect { @fetcher.fetch('') }.not_to raise_error
    end
  end
end