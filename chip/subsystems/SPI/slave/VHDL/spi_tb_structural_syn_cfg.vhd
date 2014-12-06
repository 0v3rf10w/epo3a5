configuration spi_tb_structural_syn_cfg of spi_tb is
   for structural
      for all: spi use configuration work.spi_synthesised_cfg;
      end for;
      for all: spi_slave use configuration work.spi_slave_synthesised_cfg;
      end for;
   end for;
end spi_tb_structural_syn_cfg;


