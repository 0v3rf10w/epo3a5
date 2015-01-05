configuration cpu_tb_behaviour_syn_cfg of cpu_tb is
   for behaviour
      for all: cpu use configuration work.cpu_synthesised_cfg;
      end for;
   end for;
end cpu_tb_behaviour_syn_cfg;


