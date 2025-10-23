document.addEventListener("turbo:load", () => {
  document.querySelectorAll("[id^='multiSelect_']").forEach((multiSelect) => {
    const id           = multiSelect.id.split("_")[1];
    const dropdown     = document.getElementById(`dropdown_${id}`);
    const selectedWrap = document.getElementById(`selectedItems_${id}`);
    const hiddenField  = document.getElementById(`procesos_${id}`);

    // 1) Construir Set con los valores iniciales
    const initial = (multiSelect.dataset.selected || hiddenField.value || "")
      .split(",")
      .map(s => s.trim())
      .filter(Boolean);

    const selectedValues = new Set(initial);

    // 2) Función para crear un tag
    function addTag(label, value) {
      // evita duplicados
      if (Array.from(selectedValues).includes(value)) return;

      selectedValues.add(value);
      const tag = document.createElement("span");
      tag.innerHTML = `${label} <i data-remove="${value}" style="cursor:pointer">&times;</i>`;
      selectedWrap.appendChild(tag);
      syncHidden();
      markDropdown(value, true);
    }

    // 3) Función para quitar un tag
    function removeTag(value) {
      selectedValues.delete(value);
      [...selectedWrap.children].forEach(el => {
        const i = el.querySelector("i[data-remove]");
        if (i && i.dataset.remove === value) el.remove();
      });
      syncHidden();
      markDropdown(value, false);
    }

    // 4) Sincroniza el hidden con el Set
    function syncHidden() {
      hiddenField.value = Array.from(selectedValues).join(",");
    }

    // 5) Marca/desmarca en el dropdown
    function markDropdown(value, active) {
      const item = dropdown.querySelector(`[data-value="${CSS.escape(value)}"]`);
      if (item) {
        if (active) {
          item.classList.add("active");
        } else {
          item.classList.remove("active");
        }
      }
    }

    // 6) Render inicial de tags y marcado en dropdown
    initial.forEach(v => {
      const item = dropdown.querySelector(`[data-value="${CSS.escape(v)}"]`);
      const label = item ? item.textContent : v;
      // crear visual si no existe ya en el wrap
      if (![...selectedWrap.querySelectorAll("i[data-remove]")].some(i => i.dataset.remove === v)) {
        const tag = document.createElement("span");
        tag.innerHTML = `${label} <i data-remove="${v}" style="cursor:pointer">&times;</i>`;
        selectedWrap.appendChild(tag);
      }
      markDropdown(v, true);
    });
    syncHidden();

    // 7) Abrir/cerrar dropdown
    multiSelect.addEventListener("click", (e) => {
      // evitar cerrar cuando clickeás un tag
      if (!e.target.closest(".selected-items")) {
        multiSelect.classList.toggle("active");
      }
    });

    // 8) Click en opciones del dropdown
    dropdown.addEventListener("click", (e) => {
      const value = e.target.getAttribute("data-value");
      const label = e.target.textContent;
      if (!value) return;

      if (selectedValues.has(value)) {
        // si ya está, lo quitamos (toggle)
        removeTag(value);
      } else {
        addTag(label, value);
      }
    });

    // 9) Click en la “x” de un tag
    selectedWrap.addEventListener("click", (e) => {
      const valueToRemove = e.target.dataset.remove;
      if (valueToRemove) removeTag(valueToRemove);
    });

    // 10) Cerrar si se hace click fuera
    document.addEventListener("click", (e) => {
      if (!multiSelect.contains(e.target)) {
        multiSelect.classList.remove("active");
      }
    });
  });
  console.log("✅ multiselect.js cargado correctamente");

});