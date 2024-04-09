$(document).ready(function () {
  // === RECUPERAR REGIONES ===

  const selectRegion = $("#region");
  function recuperarRegiones(data) {
    const dataArray = JSON.parse(data);
    $.each(dataArray, function (index, item) {
      selectRegion.append(
        $("<option>", {
          value: item.id_region,
          text: item.nombre_region,
        })
      );
    });
    // Para mostrar regiones en primera carga
    selectRegion.trigger("change");
  }
  $.ajax({
    type: "GET",
    url: "http://localhost/sistema_votacion_desis/requests/region.php",
    success: recuperarRegiones,
    error: function (err) {
      alert("Ocurrio un error");
    },
  });

  // === RECUPERAR COMUNAS EN BASE A REGIONES ===

  const selectComuna = $("#comuna");
  function recuperarComunas() {
    const idRegion = selectRegion.val();
    $.ajax({
      type: "GET",
      data: { id_region: idRegion },
      url: "http://localhost/sistema_votacion_desis/requests/comuna.php",
      success: function (data) {
        const dataArray = JSON.parse(data);
        selectComuna.empty();
        $.each(dataArray, function (index, item) {
          selectComuna.append(
            $("<option>", {
              value: item.id_comuna,
              text: item.nombre_comuna,
            })
          );
        });
      },
      error: function (err) {
        alert("Ocurrio un error");
      },
    });
  }
  selectRegion.change(recuperarComunas);

  // === RECUPERAR CANDIDATOS ===
});
