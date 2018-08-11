

 
 
 




window new WaveWindow  -name  "Waves for BMG Example Design"
waveform  using  "Waves for BMG Example Design"

      waveform add -signals /nnpara0208_tb/status
      waveform add -signals /nnpara0208_tb/nnpara0208_synth_inst/bmg_port/CLKA
      waveform add -signals /nnpara0208_tb/nnpara0208_synth_inst/bmg_port/ADDRA
      waveform add -signals /nnpara0208_tb/nnpara0208_synth_inst/bmg_port/DOUTA

console submit -using simulator -wait no "run"
