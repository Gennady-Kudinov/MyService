# Car.destroy_all
# Model.destroy_all
# Make.destroy_all
# BrandEcu.destroy_all
# ModelEcu.destroy_all
# SoftEcu.destroy_all

# Новый бренд
brand_ecu = BrandEcu.create(name: 'Delphi')
  model_ecus = ['AcDelco E37', 'AcDelco E38', 'AcDelco E39', 'AcDelco E39a',
  'AcDelco E66', 'AcDelco E67', 'AcDelco E77', 'AcDelco E78',
  'AcDelco E79', 'AcDelco E80', 'AcDelco E86', 'AcDelco E87',
  'AcDelco E89', 'AcDelco E99', 'Delphi MT05', 'Delphi MT20U', 'Delphi MT20U2',
  'Delphi MT22.5', 'Delphi MT22.x', 'Delphi MT22.1', 'Delphi MT34',
  'Delphi MT34 China', 'Delphi MT35E', 'Delphi MT60', 'Delphi MT74',
  'Delphi MT74.5', 'Delphi MT80', 'Delphi MT80.x', 'Delphi MT86', 'Delphi MT92', 'Delphi MT92.1(E)',
  'Delphi MT92 Great Wall', 'Delphi MR140_HV240 Ext', 'Delphi DCM3.7 GreatWall', 'Delphi DCM3.7 GM', 
  'Delphi DCM3.7 SsangYong', 'Delphi DCM3.7 Hyundai_Kia', 'Delphi DCM3.7 VAG', 'Delphi DCM6.2 PSA']
model_ecus.each do |ecu|
  ModelEcu.create(brand_ecu: brand_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'AcDelco E37')
  acdelco_ecus = ['xxx']
acdelco_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'AcDelco E38')
  acdelco_ecus = ['xxx']
acdelco_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'AcDelco E39')
  acdelco_ecus = ['xxx']
acdelco_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'AcDelco E39a')
  acdelco_ecus = ['xxx']
acdelco_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'AcDelco E66')
  acdelco_ecus = ['xxx']
acdelco_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'AcDelco E67')
  acdelco_ecus = ['xxx']
acdelco_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'AcDelco E77')
  acdelco_ecus = ['xxx']
acdelco_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'AcDelco E78')
  acdelco_ecus = ['xxx']
acdelco_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'AcDelco E79')
  acdelco_ecus = ['xxx']
acdelco_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'AcDelco E80')
  acdelco_ecus = ['xxx']
acdelco_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'AcDelco E86')
  acdelco_ecus = ['xxx']
acdelco_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'AcDelco E87')
  acdelco_ecus = ['xxx']
acdelco_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'AcDelco E89')
  acdelco_ecus = ['xxx']
acdelco_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'AcDelco E99')
  acdelco_ecus = ['xxx']
acdelco_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'Delphi MT05')
  model_ecus = ['xxx']
model_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'Delphi MT20U')
  model_ecus = ['CZFL', 'MADO', 'MAEU', 'MAFG_36120100_40001377_028063065', 'MAGW', 'MAGR',
    'PBKL_SMW250765_28152571_28230766', 'PBSS_SMW250765_28309319_28322173', 'PBPG_SMW250765_28152571_28292691',
    'PBRH_SMW250974_28309319_28320584', 'CZFL_013770_09368529_2G3504', 'MAFJ',
    'CZFL_013770_09368529_W90D7X', 'MAFN', 'MAEC_64013770_28040177', 'CZFL_1LF211', 'LF481_MAJH', 'LF479Q1_MAJK']
model_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'Delphi MT20U2')
  model_ecus = ['PBJA_SMW251166_28152571_28221222', 'PBSR_SMW251166_28309319_28322176', 
    'РВРЕ_SMW251166_28152571_28292559', 'GW_Cowry_4G64_MADO_P5V82A', 'PAGP_28114750_28197344_P5V82A',
    'MADO', 'PAGZ', 'MAСВ', 'GW_Safe_UE20P031', 'PAFM', 'GW_Safe_UE20P050', 'GW_Sailor_UE20P050',
    'PAFN', 'PAAT']
model_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'Delphi MT22.5')
  model_ecus = ['28039847_B6001807_22p1Eg46p1', '28039847_B6202901_22p1Eg46p7', 
    '28039847_B6001807_22p1Eg46p5', '28039847_B6002033_22p1Eg46p6', 'BAFP (BAFC)_28039847_B6001597_22p1Eg45p4',
    '28480175_28603185_313756730']
model_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'Delphi MT22.x')
  model_ecus = ['xxx']
model_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'Delphi MT22.1')
  model_ecus = ['BACE_28039847_B6000452_22p1Eg43p2', 'BAEY_28039847_B6000452_22p1Eg43p4', 
    'BADX_28039847_B600167_22p1Eg46p9', 'BACD_B6000558_28039847_22p1Eg453f', 
    'BACD_B60010515_ 28039847_22p1Eg44p6', 'BACD_B60010512_28039847_22p1Eg44p6',
    'BADL_B6000558_28039847_22p1Eg43p4', 'BACD_28039847_28044006_22p1Eg43p4', 'BAFP_28039847_B6000772_22p1Eg43p4',
    'BACD_28039847_B6000773_22p1Eg44p4', 'BACD_28039847_B6000773_22p1Eg45p2', 'B6001032_28039847_22p1Eg43p4',
    'BACD_28044006_28039847_22p1Eg43p4', 'BACD_28044006_28039847_22p1Eg43p3', 'BAFP_B60000576_28039847_22p1Eg43p4']
model_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'Delphi MT34')
  model_ecus = ['xxx']
model_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'Delphi MT34 China')
  model_ecus = ['xxx']
model_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'Delphi MT35E')
  model_ecus = ['xxx']
model_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'Delphi MT60')
  model_ecus = ['xxx']
model_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'Delphi MT74')
  model_ecus = ['xxx']
model_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'Delphi MT74.5')
  model_ecus = ['xxx']
model_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'Delphi MT80')
  model_ecus = ['AADE_B6000511_28164665_28350398_8mg10p3p40', 'AADX_B6000981_28164665_28385688_8mg10p3p41',
    'AADN_B6000981_28164665_28385688_8mg10p3p41', 'AADX_B6000981_28390205_28385688_8mg10p3p41',
    'AADX_B6000511_28164665_28350398_8mg10p3p40', 'AAFE_B6000981_28390205_28385688_8mg10p3p41']
model_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'Delphi MT86')
  model_ecus = ['xxx']
model_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'Delphi MT92')
  model_ecus = ['B6207102_28550084_A4TLAP3p30', 'BAKW_B6001354_0939AMR3GW013543',
    'BAKW_B6001354_0939AMF7GW013541', 'B6000653A_0618AMS4G0150430', 'B62069012_28545004_A4TLAP3p20',
    'BAKW_B6001218_0871AMR0G1160422', 'BAKW_B6001218_0871AMF1G114111188',
    'EAAD_2835188514_B6001218A_0871AMF2G1150430', 'BAKW_B6001218_0871AMF7G1160206']
model_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'Delphi MT92 Great Wall')
  model_ecus = ['xxx']
model_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'Delphi MT92 Great Wall')
  model_ecus = ['xxx']
model_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'Delphi MR140_HV240 Ext')
  model_ecus = ['xxx']
model_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'Delphi DCM3.7 GreatWall')
  model_ecus = ['xxx']
model_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'Delphi DCM3.7 GM')
  model_ecus = ['xxx']
model_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'Delphi DCM3.7 SsangYong')
  model_ecus = ['xxx']
model_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'Delphi DCM3.7 Hyundai_Kia')
  model_ecus = ['xxx']
model_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'Delphi DCM3.7 VAG')
  model_ecus = ['xxx']
model_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'Delphi DCM6.2 PSA')
  model_ecus = ['xxx']
model_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end
# Новый бренд
brand_ecu = BrandEcu.create(name: 'Bosch')
 model_ecus = ['Bosch ME17', 'Bosch ME17.8.8', 'Bosch ME17.8.8.1', 'Bosch ME17.9.x', 'Bosch ME7.1',
  'Bosch ME7.1.x', 'Bosch ME7.4.4', 'Bosch ME7.4.5', 'Bosch ME7.5', 'Bosch ME7.5.1', 'Bosch ME7.6.x',
  'Bosch ME7.8.8', 'Bosch ME7.9.7', 'Bosch ME7.9.7.1', 'Bosch ME7.9.8', 'Bosch ME7.9.9', 'Bosch ME7.9.10',
  'Bosch ME7.9.11', 'Bosch MED7.1', 'Bosch MED7.5', 'Bosch MED17.8.10', 'Bosch MEDC17', 'Bosch ME9.x',
  'Bosch M1.5.4', 'Bosch M7.8 (7.0)', 'Bosch M7.9.7+', 'Bosch MG1US008 (Bosch_MG1UA008)', 'Bosch_МЕ17U6',
  'EDC15C2', 'EDC15C7', 'EDC15M', 'EDC16C3', 'EDC16C31', 'EDC16C34', 'EDC16C35', 'EDC16C39', 'EDC16C8',
  'EDC16CP', 'EDC16U1', 'EDC16U31', 'EDC16U34', 'EDC16U5', 'EDC16U7', 'EDC16U71', 'EDC16U8', 'EDC17C06',
  'EDC17C08', 'EDC17C10', 'EDC17C11', 'EDC17C14', 'EDC17C42', 'EDC17C46', 'EDC17C53', 'EDC17C54', 'EDC17C64',
  'EDC17C69', 'EDC17C74', 'EDC17C76', 'EDC17C84', 'EDC17CP02', 'EDC17CP09', 'EDC17CP14', 'EDC17CP20',
  'EDC17CP44', 'EDC17CP45', 'EDC17CP46', 'EDC17CP54', 'EDC17CP57', 'EDC17CP65', 'EMS2000', 'EMS3132', 'EMS3134'
 ]
model_ecus.each do |ecu|
  ModelEcu.create(brand_ecu: brand_ecu, name: ecu)
end
  
  model_ecu = ModelEcu.find_by(name: 'ME7.1.x')
    bosch_ecus = ['066906032AD_0261207373_362524', '066906032BA_0261207644_363039']
  bosch_ecus.each do |ecu|
    SoftEcu.create(model_ecu: model_ecu, name: ecu)
  end

  model_ecu = ModelEcu.find_by(name: "ME7.4.4")
    bosch_ecus = ['xxx']
  bosch_ecus.each do |ecu|
    SoftEcu.create(model_ecu: model_ecu, name: ecu)
  end

model_ecu = ModelEcu.find_by(name: 'Bosch ME17.8.8')
  bosch_ecus = ['F01R00DG36_F01R0ADF11_LF479Q', 'F01R00DY76_F01R00DC44_LF479Q',
    'F01R00DG36_F01R0ADS89_LF479Q', 'F01R00DY76_F01R0ADH46_LF479Q', 'F01R00DU85_F01R00DS97_LF479Q',
    'F01R00DY76_F01R0SDH46_LF479Q', 'F01R00DU85_F01R00DY76_LF479Q', 'F01R00DG35_F01R00DCC4_LF479Q',
    'F01R00DP24_F01R0ADS44_LF479Q', 'F01R00DG36_F01R00DP24_LF479Q', 'F01R00DS50_F01R00DCC4_LF479Q',
    'F01R00DG37_F01R00DCC4_LF479Q', 'F01R00DV96_F01R00DP24', 'F01R00DG37_F01R00DP24_LF479Q',
    'F01R0ADT27_F01R00DCC4_LF479Q', 'F01R00DU85_F01R00DBZ6_LF479Q', 'F01R00DU86_F01R0ADG88_LF479Q',
    'F01R00DS50_F01R0ADG39_LF479Q', 'F01R00DG35_F01R0ADF12_LF479Q']
bosch_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'Bosch ME17.8.8')
  soft_ecus = ['F01R0ADS94_F01R00DP46', 'F01R00DES1_F01R00DBN_LFB479_AKPP St-St',
    'F01R00DES1_F01R00DBN_LFB479_MKPP St-St', 'F01R00DES1_F01R00DBN_LFB479_MKPP', 'F01R0ADA2P_F01R00DEL8_LF479Q',
    'F01R0ADU68_F01R00DES17_LFB479', 'F01R00DES1_SAC3612100B1_US1615A100', 'US1B15A383_US1B15A302_F01R00DC2Y',
    'F01R00DES1_SAC3612100B1_US1B15A200']
soft_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end
# Новый бренд
brand_ecu = BrandEcu.create(name: 'Continental')
  continental_ecus = ['SIM2K-140', 'SIM2K-141', 'SIM2K-160', 'SIM2K-161', 'SIM2K-163', 
    'SIM2K-250', 'SIM2K-251', 'SIM2K-253', 'SIM2K-254', 'SIM2K-260', 'SIM2K-261', 'SIM2K-263',
    'SIM2K-341', 'SIM2K-342', 'SIM2K-343']
continental_ecus.each do |ecu|
  ModelEcu.create(brand_ecu: brand_ecu, name: ecu)
end
# Новый бренд
brand_ecu = BrandEcu.create(name: 'Siemens')
  model_ecus = ['Sirius 32N', 'Sirius D32 D42', 'Siemens EMS 3120', 'Siemens EMS 3125', 'Siemens EMS 3132',
    'Siemens EMS 3134']
model_ecus.each do |ecu|
  ModelEcu.create(brand_ecu: brand_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'Siemens EMS 3132')
  soft_ecus = ['xxx']
soft_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'Siemens EMS 3120')
  soft_ecus = ['xxx']
soft_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'Siemens EMS 3125')
soft_ecus = ['xxx']
soft_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end

# Новый бренд
  brand_ecu = BrandEcu.create(name: 'Denso')
    denso_ecus = ['Toyota-Denso', 'Bosch']
      denso_ecus.each do |ecu|
        ModelEcu.create(brand_ecu: brand_ecu, name: ecu)
      end
        model_ecu = ModelEcu.find_by(name: 'Toyota-Denso')
          toyota_denso_ecus = [
            '89663-02443', '89663-05784', '89663-02445', '89663-05794', '89663-02454'
                              ]
      toyota_denso_ecus.each do |ecu|
        SoftEcu.create(model_ecu: model_ecu, name: ecu)
      end
      brand_ecu = ModelEcu.find_by(name: 'Bosch')
            model_ecus = [
                    '0261201209_383989', '0261201371_383990', '0261207411_363961', '0261207547_363962',
                    '0261207547_366703', '0261208518_374635', '0261208519_370344', '0261208519_391634',
                    '0261206882_360761', '0261206882_362415', '0261206882_366700', '1037371949',
                    '1037377212', '1037371950', '1037391927', '1037372707', '1037396136', '1037372708',
                    '1037400446', '1037377211', '1037400178', '1037516709', '1037506368', '1037519525',
                    '1037516299', '1037530848', '1037516700', '1037536723'             
                          ]
      model_ecus.each do |ecu|
        SoftEcu.create(model_ecu: model_ecu, name: ecu)
      end
# Новый бренд
brand_ecu = BrandEcu.create(name: 'Magneti Marelli') 
  model_ecus = ['Marelli IAW5SF',   ]
model_ecus.each do |ecu|
  ModelEcu.create(brand_ecu: brand_ecu, name: ecu)
end
# Новый бренд
brand_ecu = BrandEcu.create(name: 'ВАЗ (Lada)') 
  model_ecus = ['Bosch M(E)17.9.7 DBL', 'Bosch M(E)17.9.7 ВАЗ', 'Bosch M(E)17.9.71 DBL',
    'Bosch M(E)17.9.71 ВАЗ', 'Bosch M7.9.7_M7.9.7+', 'Bosch MP7.0H', 'Siemens EMS 3120',
    'Siemens EMS 3125', 'Siemens EMS 3132', 'VS5.1.x', 'M73', 'M74 (74.5)', 'M74М', 'M75',
    'М86 CNG', 'М86 ПО ВАЗ', 'М86 ПО Ителма', 'Я5.1.(х)', 'Я72', 'Я72+', 'ИТЭЛМА M74.9']
model_ecus.each do |ecu|
  ModelEcu.create(brand_ecu: brand_ecu, name: ecu)
end
model_ecu = ModelEcu.find_by(name: 'Bosch M(E)17.9.7 ВАЗ')
  soft_ecus = ['1037514537_В575СB03', '1037521405_B574CD03', '1037521254_B574DD04', 
    '10SW004677_B515HJ04', '10SW056185_B515HL07', '1037513953_B574CB02', '1037513954_B574DB03',
    '1037514437_B563CA01', '1037514513_B514HC04', '1037514532_B515HC02', '1037518465_B564CA02',
    '1037523015_B564CD04', '1037523118_B514HD06', '1037524866_B574DD02', '1037524868_B575DD02',
    '1037531259_B574DF02', '1037535690_B574DH04', '1037542732_B574DH05', '1037550113_B514HD07',
    'B514HD07', 'B515HC02', 'B515HJ04', 'B563CA01_1037514437', 'B564CA02_1037518465', 'B564CD04',
    'B564CD04_1037523015', 'B574CB02_1037513953', 'B574CD03', 'B574DD04', 'B574DF02', 'B575CB03',
    'B575DB03', 'B575DD02']
soft_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end
model_ecu = ModelEcu.find_by(name: 'Bosch M(E)17.9.71 ВАЗ')
  soft_ecus = ['10SW003177_2123B4724S', '10SW009231_2123B4745S', '10SW013407_20170202_193652',
    '10SW020364_103903', '10SW047106', '10SW059965']
soft_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end
model_ecu = ModelEcu.find_by(name: 'Bosch M7.9.7_M7.9.7+')
  soft_ecus = ['10SW003177_2123B4724S', '10SW009231_2123B4745S', '10SW013407_20170202_193652',
    '10SW020364_103903', '10SW047106', '10SW059965', 'B102CR06', 'B102CQ05', 'B103CU03', 'B103EQ09',
    'B103ER12', 'B104CR02', 'B104DP16', 'B104DR17', 'B105DP09', 'B105DR10', 'B109DR02', 'B114ER18',
    'B119DR02', 'B120ER19', 'B121EN16', 'B122HR91', 'B126ER02', 'B13KSS02', 'B173DR01', 'B174CT04',
    'B174DR03', 'B174DT05', 'B174DT07', 'b174dr04', 'B1C02Q05', '22YC041S', '22YB072S', '3Т1806'
  ]
soft_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end
model_ecu = ModelEcu.find_by(name: 'Bosch MP7.0H')
  soft_ecus = ['M7D02T29', 'M7D02T33', 'M7D22T29', 'M7D22T33', 'M7F03T10', 'M7F03T10-50', 'M7F08T10-50',
    'M7F23T10', 'M7F23T10-50', 'M7F28T10-50']
soft_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end
model_ecu = ModelEcu.find_by(name: 'Siemens EMS 3120')
  soft_ecus = ['T90047_10338089AA', 'T90067_10338685AA', 'T90048_10338094AA']
soft_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end
model_ecu = ModelEcu.find_by(name: 'Siemens EMS 3125')
  soft_ecus = ['H6259S_10421586AA', 'D4223S_10410860AA', 'D8604R_37108604_10340251AA', 'D6852R_10340256AA',
    'D8765R_37108765_10343230AA']
soft_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end
model_ecu = ModelEcu.find_by(name: 'Siemens EMS 3132')
  soft_ecus = ['LARGUS_ 1.6L 8V_RE045045_8201261286', 'LARGUS_1.6L 16V_RE045045_8201474331', 
    'LARGUS_ 1.6L 8V_RE045045_8201264017', 'LARGUS_1.6L_16V_RE045045_8201474326',
    'LARGUS_1.6L 16V_RE045045_8201264666', 'LARGUS_1.6L_8V_RE045045_8201264021']
soft_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end

model_ecu = ModelEcu.find_by(name: 'VS5.1.x')
  soft_ecus = ['2104 1411020-02 V5R06T52-02', '2104 1411020-02 V5R16T52-02', '2111 1411020-72 V5F03T10-62',
    '2111 1411020-72 V5F13T10-62', '2111 1411020-72 V5F13T10-72', '2112 1411020-42 V5F05T10-42',
    '2112 1411020-42 V5F15T10-42']
soft_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end
model_ecu = ModelEcu.find_by(name: 'M73')
  soft_ecus = ['11194 1411020-01(02) A(I)373xxx_0848', '21124 1411020-11(12) A(I)308ххх_0800',
    '21067 1411020-21(22) A(I)327RD08', '21114-1411020-11(12)_0799 A317DFL07',
    '21114-1411020-11(12)_0848 A317DFL07', '21126 1411020-31(32) A(I)308ххх_0800',
    '21128 1411020-11 A3028ххх_0799', '21114 1411020-41(42) A(I)303CE05', '21114 1411020-41(42) A(I)303CF06']
soft_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end
model_ecu = ModelEcu.find_by(name: 'M74 (74.5)')
  soft_ecus = ['21067 1411020-32', '21067 1411020-47', 'Granta 11183 1411020-62', 'Granta 11186 1411020-12',
    'Granta_Datsun 11186 1411020-06', 'Granta_Datsun 11186 1411020-08', 'Granta_Datsun 11186 1411020-22',
    'Granta_Datsun 11186 1411020-23', 'Granta_Datsun 11186 1411020-43', 'Granta_Datsun 11186 1411020-46',
    'Granta_Datsun 11186 1411020-47', 'Granta_Datsun 11186 1411020-48', 'Granta_Datsun 11186 1411020-49',
    'Granta_Datsun 11186 1411020-50', 'Granta_Datsun 11186 1411020-90', 'Granta_Datsun 21126 1411020-08',
    'Granta_Datsun 21126 1411020-13', 'Granta_Datsun 21126 1411020-67', 'Granta_Datsun 21126 1411020-90',
    'Granta_Datsun 21127 1411020-38', 'Granta_Datsun 21127 1411020-39', 'Granta_Datsun 21127 1411020-44',
    'Granta_Datsun 21127 1411020-46', 'Granta_Datsun 21127 1411020-54', 'Granta_Datsun 21127 1411020-58',
    'Granta_Datsun 21127 1411020-63', 'Granta_Datsun 21127 1411020-90', 'Kalina 11183 1411020-52',
    'Kalina 2 21127 1411020-22', 'Kalina 2, Priora 21127 1411020-12', 'Priora 21116 1411020-12',
    'Priora 21116 1411020-22', 'Priora 21116 1411020-50', 'Priora 21128 1411020-12',
    'Priora_Datsun 21127 1411020-46', 'Priora_Datsun 21127 1411020-90', 'Samara 11183 1411020-02',
    'Granta Sport 21126 1411020-77']
soft_ecus.each do |ecu|
  SoftEcu.create(model_ecu: model_ecu, name: ecu)
end