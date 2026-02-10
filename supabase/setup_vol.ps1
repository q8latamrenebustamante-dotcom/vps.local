# Create directories
New-Item -ItemType Directory -Force -Path "volumes\api"
New-Item -ItemType Directory -Force -Path "volumes\db"
New-Item -ItemType Directory -Force -Path "volumes\logs"
New-Item -ItemType Directory -Force -Path "volumes\pooler"
New-Item -ItemType Directory -Force -Path "volumes\functions"

# Base URL for Supabase Docker files
$baseUrl = "https://raw.githubusercontent.com/supabase/supabase/master/docker/volumes"

# Function to download file
function Download-File {
    param ($remotePath, $localPath)
    $url = "$baseUrl/$remotePath"
    Write-Host "Downloading $remotePath to $localPath..."
    Invoke-WebRequest -Uri $url -OutFile $localPath
}

# 1. API (Kong)
Download-File "api/kong.yml" "volumes\api\kong.yml"

# 2. Database Scripts (Corrected paths based on official repo structure)
# The repo structure for volumes/db matches what maps to /docker-entrypoint-initdb.d/
Download-File "db/jwt.sql" "volumes\db\jwt.sql"
Download-File "db/logs.sql" "volumes\db\logs.sql"
Download-File "db/pooler.sql" "volumes\db\pooler.sql"
Download-File "db/realtime.sql" "volumes\db\realtime.sql"
Download-File "db/roles.sql" "volumes\db\roles.sql"
Download-File "db/webhooks.sql" "volumes\db\webhooks.sql"
Download-File "db/_supabase.sql" "volumes\db\_supabase.sql"

# 3. Logs (Vector)
Download-File "logs/vector.yml" "volumes\logs\vector.yml"

# 4. Pooler
Download-File "pooler/pooler.exs" "volumes\pooler\pooler.exs"

Write-Host "Supabase configuration files downloaded successfully."
