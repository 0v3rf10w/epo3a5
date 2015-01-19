configuration cpu_behaviour_cfg of cpu is
   for behaviour
      for all: instr_buf use configuration work.instr_buf_behaviour_cfg;
      end for;
      for all: decoder use configuration work.decoder_behaviour_cfg;
      end for;
      for all: buf_arg use configuration work.buf_arg_behaviour_cfg;
      end for;
      for all: pc_counter use configuration work.pc_counter_behaviour_cfg;
      end for;
      for all: alu use configuration work.alu_behaviour_cfg;
      end for;
      for all: reg_a use configuration work.reg_a_behaviour_cfg;
      end for;
      for all: buf_a use configuration work.buf_a_behaviour_cfg;
      end for;
      for all: reg_cluster use configuration work.reg_cluster_behavioural_cfg;
      end for;
   end for;
end cpu_behaviour_cfg;


