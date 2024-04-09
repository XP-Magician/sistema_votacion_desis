$(document).ready(function () {
  // === RECUPERAR REGIONES ===
  const selectRegion = $("#region");
  $.ajax({
    type: "GET",
    url: "http://localhost/sistema_votacion_desis/requests/region.php",
    success: function (data) {
      // Iterar sobre los datos y agregar opciones al select
      const dataArray = JSON.parse(data);
      $.each(dataArray, function (index, item) {
        selectRegion.append(
          $("<option>", {
            value: item.id_region,
            text: item.nombre_region,
          })
        );
      });
    },
    error: function (err) {
      alert("Ocurrio un error");
    },
  });

  // === RECUPERAR COMUNAS EN BASE A REGIONES ===
});
