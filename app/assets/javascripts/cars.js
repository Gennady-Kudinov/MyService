$(document).on('change', '#car_model_ecu_id', function() {
    var modelEcuId = $(this).val();
    if (modelEcuId) {
      $.ajax({
        url: '/soft_ecus',
        data: { model_ecu_id: modelEcuId },
        dataType: 'json',
        success: function(data) {
          $('#car_soft_ecu_id').html('<option value="">Select soft ecu</option>');
          $.each(data, function(i, softEcu) {
            $('#car_soft_ecu_id').append($('<option>').text(softEcu.name).attr('value', softEcu.id));
          });
        }
      });
    } else {
      $('#car_soft_ecu_id').html('<option value="">Select soft ecu</option>');
    }
  });
  