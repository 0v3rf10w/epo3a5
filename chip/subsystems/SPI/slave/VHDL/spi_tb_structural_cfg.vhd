configuration spi_tb_structural_cfg of spi_tb is
   for structural
      for all: spi_slave use configuration work.spi_slave_behavioural_cfg;
      end for;
   end for;
end spi_tb_structural_cfg;


