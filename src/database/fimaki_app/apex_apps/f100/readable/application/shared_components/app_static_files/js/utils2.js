/**
 * Author: Diego Calderón
 * Description: Allows only numbers.
 * Parameters: evt - Keypress event
 * Usage: onkeypress="return allowOnlyNumbers(event);"
 */
function allowOnlyNumbers(e) {
  var key = e.which || e.keyCode;

  // Permitir teclas de control: Backspace, Tab, flechas
  if (key === 8 || key === 9 || key === 37 || key === 39) {
    return true;
  }

  // Permitir solo números del 0 al 9
  if (key >= 48 && key <= 57) {
    return true;
  }

  // Bloquear lo demás
  return false;
}

// Previene pegar texto no numérico
function blockNonNumericPaste(e) {
  var pastedData = (e.clipboardData || window.clipboardData).getData('text');

  if (!/^\d+$/.test(pastedData)) {
    e.preventDefault();
  }
}
