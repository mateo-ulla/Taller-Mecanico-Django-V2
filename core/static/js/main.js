// Script principal
document.addEventListener("DOMContentLoaded", function () {
  console.log("Sitio web del taller mecánico cargado correctamente");

  // Aquí puedes agregar más funcionalidad JavaScript según sea necesario
});

// Ejemplo de función para validación de formularios
function validateForm(formElement) {
  const inputs = formElement.querySelectorAll("input, textarea");
  let isValid = true;

  inputs.forEach((input) => {
    if (input.required && !input.value) {
      isValid = false;
      input.classList.add("error");
    } else {
      input.classList.remove("error");
    }
  });

  return isValid;
}

// Agregar validación a todos los formularios
const forms = document.querySelectorAll("form");
forms.forEach((form) => {
  form.addEventListener("submit", function (e) {
    if (!validateForm(this)) {
      e.preventDefault();
      alert("Por favor, complete todos los campos requeridos.");
    }
  });
});
