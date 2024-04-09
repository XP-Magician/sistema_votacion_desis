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

  /* ==== VALIDAR RUT ==== */

  // ==== FORMATO Y VALIDEZ
  function validarRutHelper(rut) {
    // Elimina los puntos y guiones del RUT y lo convierte a mayúsculas
    rut = rut
      .trim()
      .replace(/\./g, "")
      .replace(/-/g, "")
      .replace(/[kK]/g, "0")
      .replace(/[^kK\d]/g, "")
      .toUpperCase();

    if (!/^[0-9]{7,8}[0-9]$/.test(rut)) {
      return false; // RUT no tiene el formato adecuado
    }

    const dv = rut[rut.length - 1];
    const rutNumerico = parseInt(rut, 10);

    // Calcula el dígito verificador
    let suma = 0;
    let multiplo = 2;
    for (let i = rut.length - 2; i >= 0; i--) {
      suma += parseInt(rut[i], 10) * multiplo;
      multiplo = multiplo === 7 ? 2 : multiplo + 1;
    }

    const dvCalculado = 11 - (suma % 11);
    if (dvCalculado === 11) {
      if (dv === "0") {
        return true; // RUT válido
      }
    } else if (dvCalculado === 10) {
      if (dv === "0") {
        return true; // RUT válido
      }
    } else if (dvCalculado === parseInt(dv, 10)) {
      return true; // RUT válido
    }

    return false; // RUT inválido
  }

  function validarRut(rutIngresado) {
    if (validarRutHelper(rutIngresado)) {
      let rutFormateado = rutIngresado.trim().replace(/[^kK\d]/g, "");
      rutFormateado =
        rutFormateado.slice(0, -1) + "-" + rutFormateado.slice(-1);
      $("#rut").val(rutFormateado);
    } else {
      alert("RUT no es válido.");
      $("#rut").val("");
    }
  }

  const campoRut = $("#rut");
  campoRut.on("blur", () => validarRut(campoRut.val()));

  // === EXISTENCIA DE VOTO ASOCIADO AL RUT
});
