
 
 
 




window new WaveWindow  -name  "Waves for BMG Example Design"
waveform  using  "Waves for BMG Example Design"


      waveform add -signals /nnparag2n1120170123_tb/status
      waveform add -signals /nnparag2n1120170123_tb/nnparag2n1120170123_synth_inst/bmg_port/CLKA
      waveform add -signals /nnparag2n1120170123_tb/nnparag2n1120170123_synth_inst/bmg_port/ADDRA
      waveform add -signals /nnparag2n1120170123_tb/nnparag2n1120170123_synth_inst/bmg_port/DOUTA
console submit -using simulator -wait no "run"
