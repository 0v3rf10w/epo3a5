configuration spi_synthesised_cfg of spi is
   for synthesised
      for all: counter use configuration work.counter_synthesised_cfg;
      end for;
      for all: shift_reg use configuration work.shift_reg_synthesised_cfg;
      end for;
      for all: control use configuration work.control_synthesised_cfg;
      end for;
   end for;
end spi_synthesised_cfg;


