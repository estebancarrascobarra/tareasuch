# Plantilla Modular de LaTeX para Física Teórica y Matemáticas

Entorno de trabajo desacoplado y optimizado para la resolución estructurada de problemas de postgrado, cálculo tensorial y física matemática.

## 📂 Estructura del Proyecto

* `main.tex`: Archivo fuente principal del documento.
* `aleph-comandos.sty`: Paquete de macros, operadores avanzados.
* `aleph-moodle.sty`: Módulo de compatibilidad y exportación de plataformas.
* `aleph-notas.cls`: Clase raíz para la maquetación estructural y tipográfica.
* `Logos/`: Recursos gráficos e insignias institucionales.

---

## 🛠️ Paquetes y Automatizaciones Core

El archivo `aleph-comandos.sty` precarga y configura las siguientes herramientas para evitar colisiones en el preámbulo:

* **Física y Tensores:** `physics` (notación Dirac, operadores), `tensor` (alineación estricta de índices covariantes/contravariantes), `slashed` (notación de Feynman) y `siunitx` (magnitudes e incertidumbres).
* **Bloques Dinámicos:** `tcolorbox` (con `skins` y `breakable`) para entornos `problema`, `desarrollo` y `formulario` que fluyen de manera continua entre páginas.
* **Saltos Atómicos:** El entorno `problema` incorpora un contador lógico interno que ejecuta un `\clearpage` automático a partir del segundo ejercicio, aislando cada problema sin alterar la hoja inicial.

---

## 🚀 Compilación

Funciona mediante **pdfLaTeX**:

```bash
pdflatex main.tex

![Captura](imagenes/screenshot.png)
