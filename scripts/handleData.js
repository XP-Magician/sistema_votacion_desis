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
  const candidatos = $("#candidato");
  function recuperarCandidatos(data) {
    const dataArray = JSON.parse(data);
    $.each(dataArray, function (index, item) {
      candidatos.append(
        $("<option>", {
          value: item.id_candidato,
          text: item.nombre_candidato,
        })
      );
    });
  }
  $.ajax({
    type: "GET",
    url: "http://localhost/sistema_votacion_desis/requests/candidato.php",
    success: recuperarCandidatos,
    error: function (err) {
      alert("Ocurrio un error");
    },
  });

  // === RECUPERAR MEDIOS DE INFORMACION ===
  const medios = $("#medios");
  function recuperarMedios(data) {
    const dataArray = JSON.parse(data);
    $.each(dataArray, function (index, item) {
      medios.append(
        $("<input>", {
          type: "checkbox",
          value: item.id_medio,
          id: item.nombre_medio,
          name: item.nombre_medio,
        })
      );
      medios.append(
        $("<label>", {
          for: item.nombre_medio,
          text: item.nombre_medio,
        })
      );
    });
    medios.trigger("loaded");
  }

  $.ajax({
    type: "GET",
    url: "http://localhost/sistema_votacion_desis/requests/medios.php",
    success: recuperarMedios,
    error: function (err) {
      alert("Ocurrio un error");
    },
  });
});
