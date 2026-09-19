$ErrorActionPreference = 'Continue'
$out = "D:\UPN\CICLO 10\Evo conf software\RRHH\RRHH\_cmi_inventory_fresh.txt"
$root = "D:\UPN\CICLO 10\Evo conf software\CMI_Backup_QA"
$lines = New-Object System.Collections.Generic.List[string]

function Add-Line([string]$s) { [void]$lines.Add($s) }

Add-Line "=== TOP-LEVEL (Depth 0) ==="
Add-Line "PathExists=$([bool](Test-Path -LiteralPath $root))"
if (Test-Path -LiteralPath $root) {
  $items = Get-ChildItem -LiteralPath $root -Force
  Add-Line "TopLevelCount=$($items.Count)"
  foreach ($i in $items) {
    $type = if ($i.PSIsContainer) { 'Directory' } else { 'File' }
    $size = if ($i.PSIsContainer) { 'N/A' } else { $i.Length }
    Add-Line ("NAME={0}|TYPE={1}|SIZE={2}|MODIFIED={3}" -f $i.Name, $type, $size, $i.LastWriteTime)
  }

  Add-Line ""
  Add-Line "=== DEPTH-1 SUBFOLDERS ==="
  $dirs = $items | Where-Object { $_.PSIsContainer }
  if (-not $dirs) { Add-Line "(no subfolders)" }
  foreach ($d in $dirs) {
    Add-Line "--- $($d.FullName) ---"
    $kids = Get-ChildItem -LiteralPath $d.FullName -Force -ErrorAction SilentlyContinue | Select-Object -First 50
    Add-Line "Shown=$($kids.Count)"
    foreach ($k in $kids) {
      $type = if ($k.PSIsContainer) { 'Directory' } else { 'File' }
      $size = if ($k.PSIsContainer) { 'N/A' } else { $k.Length }
      Add-Line ("  {0}|{1}|{2}" -f $k.Name, $type, $size)
    }
  }

  Add-Line ""
  Add-Line "=== EXTENSION SEARCH (recurse, safety cap) ==="
  $exts = @('*.bak','*.sql','*.mdf','*.ldf','*.bacpac','*.dacpac','*.zip','*.7z','*.rar')
  foreach ($ext in $exts) {
    $found = @()
    try {
      $found = @(Get-ChildItem -LiteralPath $root -Recurse -Filter $ext -File -ErrorAction SilentlyContinue | Select-Object -First 100)
    } catch {}
    Add-Line "$ext : count_capped=$($found.Count)"
    foreach ($f in ($found | Select-Object -First 20)) {
      Add-Line ("  {0} ({1} bytes)" -f $f.FullName, $f.Length)
    }
  }

  Add-Line ""
  Add-Line "=== SQL FILE COUNT / SAMPLE ==="
  $sqls = @(Get-ChildItem -LiteralPath $root -Recurse -Filter '*.sql' -File -ErrorAction SilentlyContinue | Select-Object -First 100)
  Add-Line "sql_count_capped=$($sqls.Count)"
  $sqls | Select-Object -First 20 | ForEach-Object { Add-Line ("  {0}" -f $_.Name) }
}

Add-Line ""
Add-Line "=== SQL SERVER LOCAL ==="
try {
  $sqlcmd = Get-Command sqlcmd -ErrorAction SilentlyContinue
  Add-Line ("sqlcmd={0}" -f $(if ($sqlcmd) { $sqlcmd.Source } else { 'NOT FOUND' }))
} catch { Add-Line "sqlcmd check failed" }
try {
  Get-Service '*SQL*' -ErrorAction SilentlyContinue | ForEach-Object {
    Add-Line ("SERVICE={0}|Status={1}|Display={2}" -f $_.Name, $_.Status, $_.DisplayName)
  }
} catch { Add-Line "Get-Service failed" }

Add-Line ""
Add-Line "=== BAK HEADER / VERIFY (if bak present) ==="
$bak = Join-Path $root 'CMI_Backup_QA.bak'
if (Test-Path -LiteralPath $bak) {
  $q = @"
RESTORE HEADERONLY FROM DISK = N'$bak';
RESTORE FILELISTONLY FROM DISK = N'$bak';
RESTORE VERIFYONLY FROM DISK = N'$bak';
"@
  $tmp = Join-Path $env:TEMP 'cmi_restore_check.sql'
  Set-Content -LiteralPath $tmp -Value $q -Encoding UTF8
  try {
    $outSql = & sqlcmd -S '.\SQLEXPRESS' -E -i $tmp -W -s '|' 2>&1 | Out-String
    Add-Line $outSql
  } catch {
    Add-Line ("sqlcmd restore check error: {0}" -f $_)
  }
}

Add-Line ""
Add-Line "=== RRHH SCHEMA PROBE (if DB CMI_Backup_QA or CMI exists) ==="
$probe = @"
SET NOCOUNT ON;
IF DB_ID(N'CMI_QA_PROBE') IS NOT NULL
BEGIN
  SELECT 'CMI_QA_PROBE exists' AS Info;
END
ELSE IF DB_ID(N'CMI') IS NOT NULL
BEGIN
  SELECT 'CMI exists' AS Info;
END
ELSE
BEGIN
  SELECT 'No CMI/CMI_QA_PROBE database online' AS Info;
END

DECLARE @db sysname = CASE WHEN DB_ID(N'CMI_QA_PROBE') IS NOT NULL THEN N'CMI_QA_PROBE'
                           WHEN DB_ID(N'CMI') IS NOT NULL THEN N'CMI' ELSE NULL END;
IF @db IS NOT NULL
BEGIN
  DECLARE @sql nvarchar(max) = N'
  USE ' + QUOTENAME(@db) + N';
  SELECT TOP 200 o.type_desc, s.name AS schema_name, o.name
  FROM sys.objects o
  JOIN sys.schemas s ON s.schema_id = o.schema_id
  WHERE o.is_ms_shipped = 0
    AND (
      o.name LIKE N''%Usuario%'' OR o.name LIKE N''%Empleado%'' OR o.name LIKE N''%Asistencia%''
      OR o.name LIKE N''%Permiso%'' OR o.name LIKE N''%Rol%'' OR o.name LIKE N''spRRHH_%''
      OR o.name LIKE N''spSEG_%'' OR o.name LIKE N''%RRHH%'' OR o.name LIKE N''%SEG_%''
    )
  ORDER BY o.type_desc, o.name;';
  EXEC sp_executesql @sql;
END
"@
$tmp2 = Join-Path $env:TEMP 'cmi_rrhh_probe.sql'
Set-Content -LiteralPath $tmp2 -Value $probe -Encoding UTF8
try {
  $probeOut = & sqlcmd -S '.\SQLEXPRESS' -E -i $tmp2 -W -s '|' 2>&1 | Out-String
  Add-Line $probeOut
} catch {
  Add-Line ("RRHH probe error: {0}" -f $_)
}

$lines | Set-Content -LiteralPath $out -Encoding UTF8
Write-Output "WROTE:$out"
Write-Output "LINES:$($lines.Count)"
