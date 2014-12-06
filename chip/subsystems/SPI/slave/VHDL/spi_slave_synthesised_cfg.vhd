configuration spi_slave_synthesised_cfg of spi_slave is
   for synthesised
      for all: counter use configuration work.counter_synthesised_cfg;
      end for;
      for all: shift_reg use configuration work.shift_reg_synthesised_cfg;
      end for;
   end for;
end spi_slave_synthesised_cfg;


