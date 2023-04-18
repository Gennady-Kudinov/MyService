model_ecu = ModelEcu.find_by(name: 'M74M')
  soft_ecus = ['Granta, Datsun 1.6 16V', 'Granta, Datsun 1.6 8V']
soft_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end
soft_ecu = SoftEcu.find_by(name: 'Granta, Datsun 1.6 16V')
sw_ident = ['8450106524_I535GL01c', '8450106847_I575GM01c', '8450106524_I535GL02c',
  '8450106849_I565AH06c', '8450106524_I535GM02c', '8450106849_I565AI07c', '8450106847_I575GL00c']
sw_ident.each do |ecu|
  SwIdent.create(soft_ecu: soft_ecu, name: ecu)
end
soft_ecu = SoftEcu.find_by(name: 'Granta, Datsun 1.6 8V')
sw_ident = ['8450106850_I445GDB1c3', '8450111210_I532GU04c', '8450106850_I545GDC1',
  '8450111210_I532GV05c', '8450106850_I545GDD2']
sw_ident.each do |ecu|
  SwIdent.create(soft_ecu: soft_ecu, name: ecu)
end