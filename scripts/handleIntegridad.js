$(document).ready(function () {
  // Formulario
  const form = $("#formulario");
  // al menos un checkbox seleccionado
  function medioSeleccionado() {
    const checkBoxes = $("input[type='checkbox']");
    let isSelected = false;
    $.each(checkBoxes, function (index, element) {
      if ($(element).prop("checked")) {
        isSelected = true;
        return isSelected;
      }
    });
    return isSelected;
  }

  // ENVIO DEL FORM
  form.submit(function (ev) {
    ev.preventDefault();
    if (!medioSeleccionado()) {
      alert("Seleccione un medio de información.");
    } else {
      const data_form = $(this).serialize();
      $.ajax({
        type: "POST",
        data: data_form,
        url: "http://localhost/sistema_votacion_desis/requests/voto.php",
        success: function (data) {
          if (data == true) {
            alert("Voto ingresado con éxito.");
            window.location.reload();
          } else {
            alert("Error al ingresar el voto.");
            window.location.reload();
          }
        },
        error: function (err) {
          alert("ocurrio un error");
        },
      });
    }
  });

  //
});
