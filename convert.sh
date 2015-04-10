#!/bin/bash

echo start
date
###./makseq.sh
a=1
for i in *.jpg; do
  new=$(printf "%04d.jpg" ${a}) #04 pad to length of 4
  mv ${i} ${new}
  let a=a+1
done

#####avconv -y -r 3 -i %04d.jpg  -r 30 -vcodec libx264  -crf 30 -g 15 out.mp4
avconv -y -r 3 -i %04d.jpg  -r 30 -vcodec libx264  -g 15 out.mpeg
echo finish
date
