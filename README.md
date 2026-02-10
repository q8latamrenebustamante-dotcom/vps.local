# Entorno Local VPS.local

Este directorio contiene las configuraciones de Docker Compose adaptadas para ejecución en ambiente local (desarrollo).

## Diferencias con VPS (Producción)
- **Puertos**: Se exponen directamente los puertos en `localhost`. No se requiere Traefik para acceso básico (aunque se mantiene la red `proxy`).
- **Dominios**: Se usa `http://localhost` en lugar de dominios `.com` con SSL.
- **Supabase**: Configurado para ser accesible en `http://localhost:8000` (API) y `http://localhost:8001` (Studio).

## Pasos para Iniciar

### 1. Crear Red Compartida
```powershell
docker network create proxy
```
*(O ejecuta `docker compose up` en la carpeta `proxy/`)*

### 2. Configurar Supabase
1. Navega a `VPS.local/supabase`.
2. Ejecuta el script de volúmenes (si es necesario):
   ```powershell
   .\setup_vol.ps1
   ```
3. Inicia Supabase:
   ```powershell
   docker compose up -d
   ```

### 3. Iniciar n8n
```powershell
cd ../n8n
docker compose up -d
```
Acceso en: `http://localhost:5678`

### 4. Iniciar Aplicación Next.js
```powershell
cd ../app
docker compose up -d
```
Acceso en: `http://localhost:3000`

---

## Puertos Utilizados
| Servicio | URL Local |
| :--- | :--- |
| Next.js App | http://localhost:3000 |
| n8n | http://localhost:5678 |
| Supabase Studio | http://localhost:8001 |
| Supabase API (Kong) | http://localhost:8000 |
