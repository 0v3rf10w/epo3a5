configuration blackbox_tb_behaviour_syn_cfg of blackbox_tb is
   for behaviour
      for all: blackbox use configuration work.blackbox_synthesised_cfg;
      end for;
   end for;
end blackbox_tb_behaviour_syn_cfg;


