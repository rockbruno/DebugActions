Pod::Spec.new do |s|
  s.name = 'DebugActions'
  s.module_name = 'DebugActions'
  s.version = '0.1.0'
  s.license = { type: 'MIT', file: 'LICENSE' }
  s.summary = 'Enchance UIViews with special debugging menus.'
  s.homepage = 'https://github.com/rockbruno/DebugActions'
  s.author = { 'Bruno Rocha' => 'brunorochaesilva@gmail.com' }
  s.social_media_url = 'https://twitter.com/rockbruno_'
  s.swift_version = '5.1'
  s.ios.deployment_target = '13.0'
  s.source_files = 'Sources/DebugActions/**/*'
end