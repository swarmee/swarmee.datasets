wget -r -l1 -H -t1 -nd -N -np -A.mp3 -erobots=off [url of website]



-r            recursive
-l1           maximum recursion depth (1=use only this directory)
-H            span hosts (visit other hosts in the recursion)
-t1           Number of retries
-nd           Don't make new directories, put downloaded files in this one
-N            turn on timestamping
-A.mp3        download only mp3s
-erobots=off  execute "robots.off" as if it were a part of .wgetrc

or


wget -r -np -l 1 -A zip http://example.com/download/


-r,  --recursive          specify recursive download.
-np, --no-parent          don't ascend to the parent directory.
-l,  --level=NUMBER       maximum recursion depth (inf or 0 for infinite).
-A,  --accept=LIST        comma-separated list of accepted extensions.

