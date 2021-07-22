view wave 
wave clipboard store
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 1000ps sim:/pratica2/Resetn 
wave create -driver freeze -pattern constant -value 1 -starttime 0ps -endtime 1000ps sim:/pratica2/Run 
wave create -driver freeze -pattern clock -initialvalue 0 -period 50ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/pratica2/MClock 
wave create -driver freeze -pattern clock -initialvalue 1 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/pratica2/PClock 
wave create -driver freeze -pattern clock -initialvalue 0 -period 50ps -dutycycle 50 -starttime 0ps -endtime 100000ps sim:/pratica2/MClock 
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 100000ps sim:/pratica2/PClock 
WaveCollapseAll -1
wave clipboard restore
