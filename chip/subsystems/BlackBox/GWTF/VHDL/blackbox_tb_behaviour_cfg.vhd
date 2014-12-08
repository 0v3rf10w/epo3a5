configuration blackbox_tb_behaviour_cfg of blackbox_tb is
   for behaviour
      for all: blackbox use configuration work.blackbox_behaviour_cfg;
      end for;
   end for;
end blackbox_tb_behaviour_cfg;


