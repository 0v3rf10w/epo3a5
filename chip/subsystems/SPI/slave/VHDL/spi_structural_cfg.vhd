configuration spi_structural_cfg of spi is
   for structural
      for all: counter use configuration work.counter_behavioural_cfg;
      end for;
      for all: shift_reg use configuration work.shift_reg_behavioral_cfg;
      end for;
      for all: control use configuration work.control_behavioural_cfg;
      end for;
   end for;
end spi_structural_cfg;


