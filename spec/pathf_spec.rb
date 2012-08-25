
ENV["PATH"] = File.dirname(__FILE__) + "/../bin:" + ENV["PATH"]

describe "the 'pathf' command" do

  example "[b]asename"do
    `pathf b /home/pasberth`.should == "pasberth\n"
  end

  example "un[B]asename (dirname)" do
    `pathf B /home/pasberth`.should == "/home\n"
  end

  example "[c]ar" do
    `pathf c /home/pasberth`.should == "/\n"
  end

  example "un[C]ar (cdr)" do
    `pathf C /home/pasberth`.should == "home/pasberth\n"
  end

  example "[t]ilde" do
    `pathf t $HOME`.should == "~\n"
  end
end

describe "[b]asename" do

  it "returns '/' to '/'." do
    `pathf b /`.should == "/\n"
  end

  it "returns '~' to '~'." do
    `pathf b \\~`.should == "~\n"
  end

  it "doesn't returns '/' even if the path is end with '/'."do
    `pathf b /home/pasberth/`.should == "pasberth\n"
  end
end

describe "un[B]asename (dirname)" do

  it "returns '.' to '/'" do
    `pathf B /`.should == ".\n"
  end
end

describe "[t]ilde" do

  it "returns '~' to '~'" do
    `pathf tb $HOME`.should == "~\n"
  end

  it "returns '.' to '~'" do
    `pathf tB $HOME`.should == ".\n"
  end
end
