model_ecu = ModelEcu.find_by(name: 'VS5.1.x')
  soft_ecus = ['2104 1411020-02', '2111 1411020-72', '2111 1411020-62', '2112 1411020-42']
soft_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end
soft_ecu = SoftEcu.find_by(name: '2104 1411020-02')
sw_ident = ['V5R06T52-02', 'V5R16T52-02']
sw_ident.each do |ecu|
  SwIdent.create(soft_ecu: soft_ecu, name: ecu)
end
soft_ecu = SoftEcu.find_by(name: '2111 1411020-72')
sw_ident = ['V5F13T10-72']
sw_ident.each do |ecu|
  SwIdent.create(soft_ecu: soft_ecu, name: ecu)
end
soft_ecu = SoftEcu.find_by(name: '2111 1411020-62')
sw_ident = ['V5F03T10-62', 'V5F13T10-62']
sw_ident.each do |ecu|
  SwIdent.create(soft_ecu: soft_ecu, name: ecu)
end
soft_ecu = SoftEcu.find_by(name: '2112 1411020-42')
sw_ident = ['V5F05T10-42', 'V5F15T10-42']
sw_ident.each do |ecu|
  SwIdent.create(soft_ecu: soft_ecu, name: ecu)
end