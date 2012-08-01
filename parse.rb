$: << 'tools/fdoc/src/'
require 'fdoc.rb'
require 'erb'

include FD

source_dir = 'source/_posts'
public_dir = 'public'


Dir.chdir(source_dir) 
files=Dir.glob('*.txt').sort.select{|fn| fn=~/^\d.*.txt/}.map{|fn| open(fn) }
Dir.chdir('../../')

c=nil; p=nil; n=nil; docs=[];
tpl=ERB.new( open('_page.erb').read )
for i in 0..files.length-1
    p=c
    c=n || FDoc.parse( files[i].read )
    docs << c
    n=FDoc.parse( files[i+1].read ) rescue nil

    html=tpl.result(binding)

    fn="#{c.anchor.chomp('-')}.html"
    open("#{public_dir}/"+fn,'w'){|f| 
        f.write( html ) 
    }
    puts "#{public_dir}/#{fn}... \t#{File.size("#{public_dir}/"+fn).div(1024).to_s}kb"
    #end
end

#parse faq
fn="faq.html"
c=FDoc.parse( open("#{source_dir}/faq.txt").read )
tpl=ERB.new( open('_faq.erb').read )
html=tpl.result(binding)
open("#{public_dir}/#{fn}", 'w'){|f|
    f.write( html )
}
puts "#{public_dir}/#{fn}... \t#{File.size("#{public_dir}/"+fn).div(1024).to_s}kb"

#parse resource
c=FDoc.parse( open("#{source_dir}/resource.txt").read )
tpl=ERB.new( open('_faq.erb').read )
html=tpl.result(binding)
open("#{public_dir}/#{fn}", 'w'){|f|
    f.write( html )
}
puts "#{public_dir}/#{fn}... \t#{File.size("#{public_dir}/"+fn).div(1024).to_s}kb"

#make content list page
c=Node.new {
  olist{
    docs.each do |d|
      li { 
        a "#{d.anchor.chomp('-')}.html", d.title 
        list {
          d.h2.each do |s|
            li { a "#{d.anchor.chomp('-')}.html\##{s.anchor.chomp('-')}", s.title } 
          end
        }
      }
    end
  }
}

tpl=ERB.new( open('_chapters.erb').read )
html=tpl.result(binding)

f=open("#{public_dir}/chapters.html", 'w')
f.write(html)
f.close
puts "#{public_dir}/chapters.html"
