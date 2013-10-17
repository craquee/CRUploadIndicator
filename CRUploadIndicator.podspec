Pod::Spec.new do |s|

  s.name         = "CRUploadIndicator"
  s.version      = "0.0.1"
  s.summary      = "A short description of CRUploadIndicator."

  s.description  = <<-DESC
                   A longer description of CRUploadIndicator in Markdown format.

                   * Think: Why did you write this? What is the focus? What does it do?
                   * CocoaPods will be using this to generate tags, and improve search results.
                   * Try to keep it short, snappy and to the point.
                   * Finally, don't worry about the indent, CocoaPods strips it!
                   DESC

  s.homepage     = "https://github.com/craquee/CRUploadIndicator"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author       = { "Tomoya Igarashi" => "tomoya@couger.co.jp" }

  s.platform     = :ios, '5.1'

  s.source       = { :git => "git@github.com:craquee/CRUploadIndicator.git", :tag => "0.1.1" }

  s.source_files  = 'CRUploadIndicator/**/*.{h,m}'
  s.exclude_files = 'CRUploadIndicator/**/*Tests.{h,m}'

  s.resources = 'CRUploadIndicator/**/*.{xib,png}'

  s.requires_arc = true
end
