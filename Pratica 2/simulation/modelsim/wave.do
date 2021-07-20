view wave 
wave clipboard store
wave create -driver freeze -pattern constant -value 0100000000000010 -range 15 0 -starttime 0ps -endtime 1000ps sim:/proc/DIN 
WaveExpandAll -1
wave create -driver freeze -pattern repeater -initialvalue 1 -period 50ps -sequence { 1 0  } -repeat forever -starttime 0ps -endtime 1000ps sim:/proc/Resetn 
wave create -driver freeze -pattern clock -initialvalue HiZ -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/proc/Clock 
wave create -driver freeze -pattern constant -value 1 -starttime 0ps -endtime 1000ps sim:/proc/Run 
wave create -driver freeze -pattern repeater -initialvalue 1 -period 50ps -sequence { 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0  } -repeat forever -starttime 0ps -endtime 1000ps sim:/proc/Resetn 
WaveCollapseAll -1
wave clipboard restore
