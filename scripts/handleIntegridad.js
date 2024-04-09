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

  // CHECK DE ALIAS
  const alias = $("#alias");
  alias.on("blur", function () {
    const valorAlias = $(this).val().trim();
    if (valorAlias != "") {
      $.ajax({
        type: "GET",
        data: { alias: valorAlias },
        url: "http://localhost/sistema_votacion_desis/requests/voto.php",
        success: function (data) {
          if (data != false) {
            alert("El alias ya esta en uso.");
            alias.val("");
          }
        },
      });
    }
  });

  // CHECK DE CORREO
  const correo = $("#correo");
  correo.on("blur", function () {
    const valorCorreo = $(this).val().trim();
    if (valorCorreo != "") {
      $.ajax({
        type: "GET",
        data: { correo: valorCorreo },
        url: "http://localhost/sistema_votacion_desis/requests/voto.php",
        success: function (data) {
          if (data != false) {
            alert("Ya existe un voto con este correo.");
            correo.val("");
          }
        },
      });
    }
  });

  //Check de rut asociado
  const rut = $("#rut");
  rut.on("validated", function () {
    const rut_value = $(this).val();
    $.ajax({
      type: "GET",
      data: { rut: rut_value },
      url: "http://localhost/sistema_votacion_desis/requests/voto.php",
      success: function (data) {
        if (data != false) {
          data_parsed = JSON.parse(data);
          alert("Usted ya votó el día: " + data_parsed.fecha_voto);
          window.location.reload();
        }
      },
    });
  });

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
