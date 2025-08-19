/**
 * Author: Gino Suarez
 * Description: Allows only numbers and a single decimal point.
 * Parameters: evt - Keypress event
 * Usage: onkeypress="return allowDecimalInput(event);"
 */
function allowDecimalInput(evt) {
    var charCode = evt.which || evt.keyCode;
    var input = evt.target.value;
    var charStr = String.fromCharCode(charCode);

    // Allow: backspace, tab, arrows, delete (handled separately if needed)
    if (
        charCode === 8 ||  // Backspace
        charCode === 9 ||  // Tab
        charCode === 37 || // Left
        charCode === 39 || // Right
        charCode === 46 && input.indexOf('.') === -1 // Decimal point only once
    ) {
        return true;
    }

    // Allow digits (0-9)
    if (charCode >= 48 && charCode <= 57) {
        return true;
    }

    // Block second decimal point or other characters
    if (charStr === '.' && input.indexOf('.') !== -1) {
        return false;
    }

    return false;
}
