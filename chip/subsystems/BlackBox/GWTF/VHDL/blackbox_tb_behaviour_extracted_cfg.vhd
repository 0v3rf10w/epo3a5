configuration blackbox_tb_behaviour_extracted_cfg of blackbox_tb is
   for behaviour
      for all: blackbox use configuration work.blackbox_extracted_cfg;
      end for;
   end for;
end blackbox_tb_behaviour_extracted_cfg;


