configuration tb_behaviouralsynt_cfg of tb is
   for behavioural
      for all: klokdeler use configuration work.klokdeler_synthesised_cfg;
      end for;
   end for;
end tb_behaviouralsynt_cfg;

