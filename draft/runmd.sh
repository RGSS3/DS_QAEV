#!/usr/bin/env bash
ruby -e '
lines = []
fopen = 0
File.read(ARGV[0]).split("\n").each{|line|
    if line.strip == "```scala"
       fopen = 1
    elsif line.strip == "```bash"
       fopen = 2
    elsif line.strip == "```"
       if fopen == 1
          r = lines[0][/<(.+)>/, 1]
          File.write r, lines[0..-1].join("\n") + "\n"
       elsif fopen == 2
          puts "> " + lines[0..-1].join("\n") + "\n" if lines.size == 1
          File.write "/tmp/runmd.sh", lines[0..-1].join("\n") + "\n"
          system "chmod +x /tmp/runmd.sh"
          system "/tmp/runmd.sh"
       else
          puts "Unknown"
       end
       lines = []
       fopen = 0
    else
       if fopen == 1 || fopen == 2
          lines << line
       end
    end
}
' $1

