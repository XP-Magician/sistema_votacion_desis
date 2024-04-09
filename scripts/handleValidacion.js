$(document).ready(function () {
  /* ==== PERMITIR UNICAMENTE UNA SELECCION EN MEDIOS DE INFORMACION ==== */
  function validarMedios() {
    const $checkBoxes = $("input[type='checkbox']");
    $checkBoxes.click(function () {
      $checkBoxes.not(this).prop("checked", false);
    });
  }
  const medios = $("#medios");
  medios.on("loaded", validarMedios);
});
