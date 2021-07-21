view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue HiZ -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/pratica2/clock 
wave create -driver freeze -pattern clock -initialvalue HiZ -period 50ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/pratica2/pcClock 
wave create -driver freeze -pattern clock -initialvalue HiZ -period 25ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/pratica2/pcClock 
wave create -driver freeze -pattern repeater -initialvalue 1 -period 50ps -sequence { 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0  } -repeat forever -starttime 0ps -endtime 1000ps sim:/pratica2/resetN 
wave create -driver freeze -pattern constant -value 1 -starttime 0ps -endtime 1000ps sim:/pratica2/run 
wave create -driver freeze -pattern constant -value 1 -starttime 0ps -endtime 1000ps sim:/pratica2/resetN 
wave create -driver freeze -pattern repeater -initialvalue 1 -period 25ps -sequence { 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0  } -repeat forever -starttime 0ps -endtime 1000ps sim:/pratica2/resetN 
WaveCollapseAll -1
wave clipboard restore
