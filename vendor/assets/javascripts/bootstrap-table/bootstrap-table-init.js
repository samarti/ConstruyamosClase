$(document).ready(function(){

(function ($) {
    'use strict';

    $.fn.bootstrapTable.locales['es-CL'] = {
        formatLoadingMessage: function () {
            return 'Cargando, espere por favor...';
        },
        formatRecordsPerPage: function (pageNumber) {
            return pageNumber + ' registros por página';
        },
        formatShowingRows: function (pageFrom, pageTo, totalRows) {
            return 'Mostrando ' + pageFrom + ' a ' + pageTo + ' de ' + totalRows + ' filas';
        },
        formatSearch: function () {
            return 'Buscar';
        },
        formatNoMatches: function () {
            return 'No se encontraron registros';
        },
        formatAllRows: function () {
            return 'Todo';
        }
    };

    $.extend($.fn.bootstrapTable.defaults, $.fn.bootstrapTable.locales['es-AR']);

})(jQuery);

/* ==========================================================================
	Tables
	========================================================================== */

	var $table = $('#table'),
		$remove = $('#remove'),
		selections = [];
		data = [];

	$.ajax({
		url: window.location.href  + ".json",
		type: "GET",
		success: result => {
			data = result;
			initTable();
		},
		error: function(result){
			console.log(result);
		},
	})
	function totalTextFormatter(data) {
		return 'Total';
	}

	function totalNameFormatter(data) {
		return data.length;
	}

	function nameFormatter(data){
		return '<div>' + data + '</div>';
	}

	function linkFormatter(data){
        var link = "http://" + window.location.host + data;
		return '<div> <a href="' + link + '" type="button" class="btn btn-primary btn-sm">' + data.split('/').pop() + '</a></div>';
	}


	function initTable(){
		$table.bootstrapTable({
			iconsPrefix: 'font-icon',
			icons: {
				paginationSwitchDown:'font-icon-arrow-square-down',
				paginationSwitchUp: 'font-icon-arrow-square-down up',
				refresh: 'font-icon-refresh',
				toggle: 'font-icon-list-square',
				columns: 'font-icon-list-rotate',
				export: 'font-icon-download',
				detailOpen: 'font-icon-plus',
				detailClose: 'font-icon-minus-1'
			},
			paginationPreText: '<i class="font-icon font-icon-arrow-left"></i>',
			paginationNextText: '<i class="font-icon font-icon-arrow-right"></i>',
			data: data,
			columns: [
				[

					{
						title: 'Item ID',
						field: 'id',
						rowspan: 2,
						colspan: 1,
						width: 10,
						align: 'center',
						valign: 'middle',
						sortable: true,
						footerFormatter: totalTextFormatter
					},
					{
						title: 'Detalles',
						colspan: 2,
						align: 'center'
					}
				],
				[
					{
						field: 'name',
						title: 'Nombre',
						sortable: true,
						editable: true,
						formatter: nameFormatter,
						align: 'center'
					},
					{
						field: 'url',
						title: 'Archivo',
						sortable: true,
						align: 'center',
						formatter: linkFormatter
					}
				]
			]
		});
	}

	$table.on('check.bs.table uncheck.bs.table ' +
		'check-all.bs.table uncheck-all.bs.table', function () {
		$remove.prop('disabled', !$table.bootstrapTable('getSelections').length);
		// save your data, here just save the current page
		selections = getIdSelections();
		// push or splice the selections if you want to save all data selections
	});

	$remove.click(function () {
		var ids = getIdSelections();
		$table.bootstrapTable('remove', {
			field: 'id',
			values: ids
		});
		$remove.prop('disabled', true);
	});

	$('#toolbar').find('select').change(function () {
		$table.bootstrapTable('refreshOptions', {
			exportDataType: $(this).val()
		});
	});

/* ========================================================================== */
});
