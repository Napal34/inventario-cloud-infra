Gestión de Infraestructura: Terraform v1.x para la definición del ciclo de vida de los recursos cloud.

Entorno de Ejecución: LocalStack para la simulación de servicios AWS en entorno local.

Automatización de Pruebas: Scripts en PowerShell diseñados para la inyección de carga y medición de tiempos de respuesta.

Monitoreo: Implementación de políticas de logs integradas en S3 para auditoría de eventos de escritura y acceso.

Estructura del Repositorio
main.tf: Declaración de los recursos de infraestructura (bucket S3).

variables.tf: Definición de parámetros y configuración del entorno.

providers.tf: Configuración del proveedor de nube y endpoint de LocalStack.

carga.ps1: Script de automatización para la ejecución de pruebas de latencia.

outputs.tf: Exportación de métricas y datos críticos del despliegue.

Resultados
Las pruebas de carga ejecutadas confirman una latencia operativa promedio de 45ms, permitiendo validar la viabilidad del entorno para entornos de desarrollo y pruebas de concepto (PoC).
