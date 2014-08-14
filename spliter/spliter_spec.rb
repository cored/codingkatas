module UrlSpliter

  def protocol
    self.split(/\:/)[0]
  end

  def domain 
    self.split(/\:\/\//)[1]
  end

  private 

  def url_parts
    self.split(/
  end

end

describe UrlSpliter do

  it 'returns the protocol for an url' do
    expect('http://some.thing'.extend(UrlSpliter).protocol).to eql 'http'
  end

  it 'returns the domain for an url' do 
    expect('ftp://a.large.site'.extend(UrlSpliter).domain).to eql 'a.large.site'
  end

end
