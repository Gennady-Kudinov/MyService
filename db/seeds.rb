model_ecu = ModelEcu.find_by(name: 'Siemens EMS 3132')
  soft_ecus = ['Largus 1.6']
soft_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end
soft_ecu = SoftEcu.find_by(name: 'Largus 1.6')
sw_ident = ['LARGUS_ 1.6L 8V_RE045045_8201261286', 'LARGUS_1.6L 16V_RE045045_8201474331', 'LARGUS_ 1.6L 8V_RE045045_8201264017',
  'LARGUS_1.6L_16V_RE045045_8201474326', 'LARGUS_1.6L 16V_RE045045_8201264666', 'LARGUS_1.6L_8V_RE045045_8201264021']
sw_ident.each do |ecu|
  SwIdent.create(soft_ecu: soft_ecu, name: ecu)
end