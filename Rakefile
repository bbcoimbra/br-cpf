require 'bundler'
Bundler::GemHelper.install_tasks

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new

task :default => [:compile_ext, :spec]

task :compile_ext do
  require 'fileutils'
  root_dir = pwd
  cd 'ext/CPF'
  system 'ruby extconf.rb'
  system 'make'
  cp "CPF.so", "#{root_dir}/lib/"
  cd root_dir
end
