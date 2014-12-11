configuration blackbox_behaviour_cfg of blackbox is
   for behaviour
      for all: stream use configuration work.stream_behaviour_cfg;
      end for;
   end for;
end blackbox_behaviour_cfg;


