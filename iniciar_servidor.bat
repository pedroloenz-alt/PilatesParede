@echo off
title Servidor Local - Quiz Pilates
echo ====================================================
echo        INICIANDO SERVIDOR LOCAL DO QUIZ
echo ====================================================
echo.
echo Abrindo em: http://localhost:3000
echo Pressione Ctrl+C para encerrar.
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "& { $port = 3000; $listener = New-Object System.Net.HttpListener; $listener.Prefixes.Add('http://localhost:3000/'); try { $listener.Start() } catch { $port = 8080; $listener = New-Object System.Net.HttpListener; $listener.Prefixes.Add('http://localhost:8080/'); $listener.Start() }; Start-Process \"http://localhost:$port\"; Write-Host \"Servidor rodando em http://localhost:$port/\" -ForegroundColor Green; $mime = @{ '.html'='text/html; charset=utf-8'; '.css'='text/css; charset=utf-8'; '.js'='application/javascript; charset=utf-8'; '.json'='application/json; charset=utf-8'; '.webp'='image/webp'; '.png'='image/png'; '.jpg'='image/jpeg'; '.jpeg'='image/jpeg'; '.svg'='image/svg+xml'; '.woff2'='font/woff2' }; while ($listener.IsListening) { $ctx = $listener.GetContext(); $req = $ctx.Request; $res = $ctx.Response; $p = $req.Url.LocalPath.TrimStart('/'); if ([string]::IsNullOrEmpty($p)) { $p = 'index.html' }; $p = $p -replace '/', '\'; $f = Join-Path $PSScriptRoot $p; if (Test-Path $f -PathType Container) { $f = Join-Path $f 'index.html' }; if (Test-Path $f -PathType Leaf) { $ext = [System.IO.Path]::GetExtension($f).ToLower(); if ($mime.ContainsKey($ext)) { $res.ContentType = $mime[$ext] } else { $res.ContentType = 'application/octet-stream' }; $bytes = [System.IO.File]::ReadAllBytes($f); $res.ContentLength64 = $bytes.Length; $res.OutputStream.Write($bytes, 0, $bytes.Length) } else { $res.StatusCode = 404; $msg = [System.Text.Encoding]::UTF8.GetBytes('404 Not Found'); $res.OutputStream.Write($msg, 0, $msg.Length) }; $res.OutputStream.Close() } }"
pause
