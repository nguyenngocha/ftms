function set_datatable(selector, not_order_column, dom) {
  var default_dom = "<'row'<'col-sm-10'f><'col-sm-2'l>>"
  + "<'row'<'col-sm-12'tr>>" + "<'row'<'col-sm-5'i><'col-sm-7'p>>";

  dom = dom || default_dom;

  selector.dataTable({
    retrieve: true,
    "dom": dom,
    bJQueryUI: true,
    bProcessing: true,
    bServerSide: true,
    aLengthMenu: [
      [5, 10, 20, 50, 100, -1],
      [5, 10, 20, 50, 100, "All"]
    ],
    order: [1],
    "columnDefs": [{"orderable": false, "targets": not_order_column}],
    "pageLength": 10,
    sAjaxSource: selector.data("source"),
    language: {
      search: "_INPUT_",
      searchPlaceholder: I18n.t("datatables.search_name"),
      sLengthMenu: I18n.t("datatables.show_menu")
    }
    "fnInitComplete": function (o ,j) {
        var trainers = {};

  $('td:nth-child(3)>a').map(function(e){return trainers[$(e).attr('href')
    .charAt( $(e).attr('href').length - 1 )] = $(e).attr('title')});
  $.each(trainers, function (key, value) {
    $('select[rel = 2]').append($('<option>'), {
      value: e.key,
      title: e.value
    });
  });
    }
  });
}

