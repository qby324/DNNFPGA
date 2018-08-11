
 
 
 




window new WaveWindow  -name  "Waves for BMG Example Design"
waveform  using  "Waves for BMG Example Design"


      waveform add -signals /nnpara11bittest2_tb/status
      waveform add -signals /nnpara11bittest2_tb/nnpara11bittest2_synth_inst/bmg_port/CLKA
      waveform add -signals /nnpara11bittest2_tb/nnpara11bittest2_synth_inst/bmg_port/ADDRA
      waveform add -signals /nnpara11bittest2_tb/nnpara11bittest2_synth_inst/bmg_port/DOUTA
console submit -using simulator -wait no "run"
