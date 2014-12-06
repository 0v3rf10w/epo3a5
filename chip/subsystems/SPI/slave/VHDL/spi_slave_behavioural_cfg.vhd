configuration spi_slave_behavioural_cfg of spi_slave is
   for behavioural
      for all: counter use configuration work.counter_behavioural_cfg;
      end for;
      for all: shift_reg use configuration work.shift_reg_behavioral_cfg;
      end for;
   end for;
end spi_slave_behavioural_cfg;


