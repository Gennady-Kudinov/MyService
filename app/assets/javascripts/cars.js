$(document).on('change', '#car_brand_ecu_id', function() {
    var brandEcuId = $(this).val();
    if (brandEcuId) {
      $.ajax({
        url: '/model_ecus',
        data: { brand_ecu_id: brandEcuId },
        dataType: 'json',
        success: function(data) {
          $('#car_model_ecu_id').html('<option value="">Select model</option>');
          $.each(data, function(i, modelEcu) {
            $('#car_model_ecu_id').append($('<option>').text(modelEcu.name).attr('value', modelEcu.id));
          });
        }
      });
    } else {
      $('#car_model_ecu_id').html('<option value="">Select model</option>');
    }
  });
  