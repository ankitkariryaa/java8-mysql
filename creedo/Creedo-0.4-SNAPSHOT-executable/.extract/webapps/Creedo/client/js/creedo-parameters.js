/*
 * The MIT License (MIT)
 *
 * Copyright (c) 2015 University of Bonn
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
/**
 * @author Björn Jacobs
 * @author Mario Boley
 */

CREEDO.namespace("CREEDO.parameters");

CREEDO.parameters = (function() {

	function generateInvalidValueSign(param) {
		var invalidValueSign = $(
				'<span/>',
				{
					'class' : 'glyphicon glyphicon-exclamation-sign red-tooltip red-icon'
				});
		invalidValueSign.attr({
			'data-toggle' : 'tooltip',
			'data-placement' : 'bottom',
			title : " " + param.solutionHint
		});
		return invalidValueSign;
	}

	function generateNotVerifiableSign(param) {
		var notVerifiableSign = $(
				'<span/>',
				{
					'class' : 'glyphicon glyphicon-exclamation-sign red-tooltip red-icon'
				});
		notVerifiableSign.attr({
			'data-toggle' : 'tooltip',
			'data-placement' : 'bottom',
			title : " " + param.dependsOnNotice + "!"
		});
		return notVerifiableSign;
	}

	function renderOptionsInSelectHTMLElement(current, newSelect,
			selectedValues) {
		if (current.active) {
			$.each(current.range, function(index, current) {
				var newOption = $('<option/>', {
					text : current,
					value : current
				});
				if (current in selectedValues) {
					newOption.prop('selected', true);
				}
				newOption.on('change', function() {
					alert("option changed");
				});
				newSelect.append(newOption);
			});
		}
	}

	function makeTextInputElement(parameter) {
		var result = $('<input/>', {
			type : 'text',
			'class' : 'form-control text-parameter creedo-parameter-input',
			id : parameter.name,
			val : parameter.value,
			paramName : parameter.name,
		});
		result.html(parameter.name);
		result[0].getParameterValue = function() {
			return this.value;
		};

		result.on('change', function() {
			result.trigger('creedo:param-changed', [ parameter.name,
					result[0].getParameterValue() ]);
		});

		return result;
	}

	function makeSingleSelectInputElement(parameter) {
		var result = $(
				'<select/>',
				{
					'class' : 'form-control range-enumerable-parameter creedo-parameter-input',
					id : parameter.name,
					paramName : parameter.name,
				});

		var selectedValues = Object.create(null);
		if (parameter.value != null) {
			selectedValues[parameter.value] = true;
		}

		renderOptionsInSelectHTMLElement(parameter, result, selectedValues);

		result[0].getParameterValue = function() {
			return this.value;
		};

		result.on('change', function() {
			result.trigger('creedo:param-changed', [ parameter.name,
					result[0].getParameterValue() ]);
		});

		result.on('creedo:dom-insertion', function() {
			$(this).select2();
		});

		return result;
	}

	function makeMultipleSelectInputElement(parameter) {
		var data = [];
		var initValue = "";

		if (parameter.values != null) {
			initValue = parameter.values.toString();
		}

		if (parameter.active) {
			$.each(parameter.range, function(index, rangeElement) {
				data.push({
					id : rangeElement,
					text : rangeElement
				});
			});
		}
		var result = $('<input/>', {
			'class' : 'form-control subset-parameter creedo-parameter-input',
			'type' : 'hidden',
			id : parameter.name,
			paramName : parameter.name,
			value : parameter.values
		});

		result[0].getParameterValue = function() {
			return "[" + this.value + "]";
		};

		var lastReportedValue = result[0].getParameterValue();
		var dropDownOpen = false;

		result.conditionallyTriggerParamChange = function() {
			var currentValue = result[0].getParameterValue();
			if (lastReportedValue !== currentValue) {
				lastReportedValue = currentValue;
				result.trigger('creedo:param-changed', [ parameter.name,
						currentValue ]);
			}
		};

		result.on('select2-close', function(event) {
			dropDownOpen = false;
			result.conditionallyTriggerParamChange();
		});

		result.on('select2-open', function(event) {
			dropDownOpen = true;
		});

		result.on('select2-removed', function(event) {
			if (!dropDownOpen) {
				result.conditionallyTriggerParamChange();
			}
		});

		result.on('creedo:dom-insertion', function(event) {
			$(this).select2({
				closeOnSelect : false,
				data : data,
				multiple : true,
				initSelection : function(element, callback) {
					var data = [];
//					console.log('initSelection');
//					console.dir(element.val());
					$(element.val().split(",")).each(function() {
						data.push({
							id : this,
							text : this
						});
					});
					callback(data);
				}
			});
		});

		return result;
	}

	function makeSortableMultiSelect(parameter) {

		var result=makeMultipleSelectInputElement(parameter);
		
		result.on('creedo:dom-insertion', function(event) {
			var $element = $(this);
			$element.select2("container").find("ul.select2-choices").sortable({
				containment : 'parent',
				start : function() {
					$element.select2("onSortStart");
				},
				update : function() {
					$element.select2("onSortEnd");
					result.conditionallyTriggerParamChange();
				}
			});
		});
		
		return result;

	}

	function makeSortableInputElement(parameter) {

		var result = $(
				'<div></div>',
				{
					id : parameter.name,
					'class' : 'dropdown form-control subcollection-parameter creedo-parameter-input',
					paramName : parameter.name,
				});

		// componentId="${componentId}"}
		// <c:if test="${not parameter.active}">disabled</c:if>>

		var summaryContainer = $('<div></div>', {
			'class' : "dropdown-toggle",
			'data-toggle' : "dropdown"
		}).append($('<label></label>', {
			'class' : 'selected-summary',
			text : 'Multiple Select'
		})).append($('<b></b>', {
			'class' : 'caret'
		}));

		result.append(summaryContainer);

		var dropDownContainer = $('<ul></ul>', {
			'class' : 'dropdown-menu col-xs-12'
		});

		function makeDragElementColumn(title, elements, id) {
			var col = $('<div></div>', {
				'class' : 'col-xs-6'
			});
			col.append($('<h5>' + title + '</h5>'));

			// TODO: availableTable should probably be class as well (not
			// necessarily unique)
			// probably id can be dropped entirely because is only used to
			// connect
			// columns, which in js can be done directly on creation
			var table = $('<ul></ul>', {
				'id' : id,
				'class' : "connectedSortable col-xs-11"
			});

			$.each(elements, function(index, value) {
				table.append($('<li></li>', {
					'class' : "ui-state-default",
					'value' : value,
					'text' : value
				}).css({
					margin : "0 5px 5px 5px",
					padding : "5px",
					"font-size" : "1.0em",
					overflow : "hidden"
				}));
			});

			table.css({
				border : "1px solid black",
				margin : "5px",
				padding : "5px 0 0 0",
				height : "300px",
				"list-style-type" : "none"
			});

			// table.sortable({
			// connectWith : ".connectedSortable"
			// }).disableSelection();

			col.append(table);

			return col;
		}

		if (parameter.active) {

			var availableColumn = makeDragElementColumn('Available', $.grep(
					parameter.range, function(el, ix) {
						return parameter.values.indexOf(el) === -1
					}), 'availableTable');
			var selectedColumn = makeDragElementColumn('Selected',
					parameter.values, 'selectedTable');

			dropDownContainer.append($('<div></div>', {
				'class' : 'row'
			}).append(availableColumn).append(selectedColumn));

			dropDownContainer.find("#availableTable, #selectedTable").sortable(
					{
						connectWith : ".connectedSortable"
					}).disableSelection();
		}

		result.append(dropDownContainer);

		/**
		 * Ensure the dropdown in the subcollection-paramenter control element
		 * to be on the top, so that it is visible.
		 */
		result.on('show.bs.dropdown', function() {
			$(this).css('z-index', 1030);
		});

		result[0].getParameterValue = function() {
			var values = [];
			$('#selectedTable', this).find('li').each(function() {
				values.push($(this).attr('value'));
			});
			return "[" + values.toString() + "]";
		}

		/**
		 * Input element triggers its change event when drop-down is hidden
		 */
		result.on('hide.bs.dropdown', function() {
			result.change();
			result.trigger('creedo:param-changed', [ parameter.name,
					result[0].getParameterValue() ]);
		});

		/**
		 * Summarize with the selected item names in the
		 * subcollection-paramenter control element.
		 */
		var values = [];
		$(result).find('#selectedTable').find('li').each(function() {
			values.push($(this).attr('value'));
		});
		$(result).find('.selected-summary').text(values);

		return result;
	}

	/**
	 * Iterates over the given parameters and creates a tree of html elements
	 * that represent the given parameters visually. This tree of elements is
	 * appended to the provided target element.
	 * 
	 * @param targetElement
	 *            Tag to draw visual representation to (previous contents will
	 *            be removed)
	 * @param parameters
	 *            List of parameters to render
	 * @return boolean is true if parameter information provided by the server
	 *         indicates that all parameters are valid.
	 */
	function renderParameters(targetElement, parameters) {
		var allOk = true;

		targetElement.empty();

		// Iterate over received parameter configurations
		$.each(parameters, function(index, current) {

			var leftColWidth = 4 + current.depth;
			var rightColWidth = 8 - current.depth;

			// Build columns
			var paramColLeft = $('<div/>', {
				'class' : 'col-xs-' + leftColWidth + ' text-right'
			});
			var paramColRight = $('<div/>', {
				'class' : 'col-xs-' + rightColWidth
			});

			// Create a new row
			var row = $('<div/>', {
				class : 'row paramMargin'
			});
			row.append(paramColLeft);
			row.append(paramColRight);

			// Create label and attach it to left column
			var newLabel = $('<label/>', {
				'for' : current.name
			});
			newLabel.html(current.name + ":&nbsp;");

			$(newLabel).attr({
				'data-toggle' : 'tooltip',
				'data-placement' : 'top',
				title : " " + current.description
			});

			paramColLeft.append(newLabel);

			// Create input div on the right column
			var newDiv = $('<div/>', {
				'class' : 'input-group col-xs-12'
			});
			var inputElement;

			var typeToMakerConf = {
				'Subcollection' : makeSortableMultiSelect,
				'Subset' : makeMultipleSelectInputElement,
				'RangeEnumerable' : makeSingleSelectInputElement
			};

			// Now differentiate between extensional and intentional
			// if (current.multiplicity != null) {
			if (typeToMakerConf[current.type] !== undefined) {
				inputElement = typeToMakerConf[current.type](current);
			} else {
				// text case is fall-back case
				inputElement = makeTextInputElement(current);
			}

			// bind paramater state to input element
			inputElement[0].parameterState = current;

			if (!current.active) {
				inputElement.prop('disabled', true);
				newDiv.addClass('has-error');
				$(paramColLeft).append(generateNotVerifiableSign(current));
			} else {
				if (!current.valid) {
					newDiv.addClass('has-error');
					$(paramColLeft).append(generateInvalidValueSign(current));
				}
			}

			newDiv.append(inputElement);
			paramColRight.append(newDiv);
			targetElement.append(row);

			if (!current.active || !current.valid) {
				allOk = false;
			}

			inputElement.trigger('creedo:dom-insertion');

		});

		// Initialize tooltips
		targetElement.find("[data-toggle=tooltip]").tooltip();
		targetElement.find("[data-toggle=popover]").popover();

		// $(targetElement).find('.subset-parameter').select2({
		// closeOnSelect : false
		// });

		// $(targetElement).find('.range-enumerable-parameter').select2();

		return allOk;
	}

	return {
		renderParameters : renderParameters
	};

}());
