Pod::Spec.new do |s|
  s.name             = "NativePopup"
  s.version          = "1.2.3"
  s.summary          = "native popup"
  
  s.description      = <<-DESC
                       Something
                       DESC

  s.homepage         = "https://github.com/Fuxingloh/NativePopup"
  s.license          = 'MIT'
  s.author           = { "Fuxingloh" => "a@b.c" }
  s.source           = { :git => "https://github.com/Fuxingloh/NativePopup.git", :tag => s.version.to_s }
  
  s.platform         = :ios, '9.0'
  s.requires_arc     = true

  s.source_files = 'NativePopup/*'
end
