configuration calculator_behaviour_cfg of calculator is
   for behaviour
      for all: cpu use configuration work.cpu_behaviour_cfg;
      end for;
      for all: gate use configuration work.gate_behavioral_cfg;
      end for;
      for all: rom use configuration work.rom_behavioural_cfg;
      end for;
      for all: shift_reg use configuration work.shift_reg_behaviour_cfg;
      end for;
   end for;
end calculator_behaviour_cfg;


