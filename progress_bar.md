# Recently, I found about a nice tool for showing the progress when extracting a compressed 
# tar file on the command line: pv. pv monitors the progress of data as it goes through a pipe, 
# so we need to send the file to tar using a pipe:

pv file.tgz | tar xzf - -C target_directory

This will show elapsed time, percentage completed with a progress bar and an estimated time to completion (ETA), something like this

1.16MB 0:00:20 [6.06MB/s] [==================>               ] 55%  ETA 0:00:37

# The command above showed very useful, 
# but I wanted to be able to show the progress of extraction using dialog. 
# This is an example script of a progress bar using dialog:

#!/bin/bash
 
(
for i in {0..100..10}
do
	echo $i
	sleep 1
done
) | dialog --gauge "Progress" 10 40

And this is the command to show the progress of file extraction using pv and dialog:

$ (pv -n file.tgz | tar xzf - -C target_directory ) 2>&1 | dialog --gauge "Extracting file..." 6 50
