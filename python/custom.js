/* jupyter custom js */

console.log('custom.js');

define([
    'base/js/namespace',
    'base/js/promises'
], function(Jupyter, promises) {
    promises.app_initialized.then(function(appname) {
        if (appname === 'NotebookApp') {
            console.log('app_initialized');
            require("notebook/js/codecell").CodeCell.input_prompt_function = function (prompt_value, lines_number) {
                return (prompt_value == '*') ? '*' : '';
            }
            require("notebook/js/outputarea").OutputArea.output_prompt_function = function (prompt_value) {
                return '';
            }
            $('.input_prompt').html('');
            $('.output_prompt').html('');
        }
    });
});
