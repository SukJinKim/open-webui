@echo off
setlocal enabledelayedexpansion

:: Check if docker-compose command exists, else fallback to 'docker compose'
where docker-compose >nul 2>nul
if %errorlevel%==0 (
    set DOCKER_COMPOSE=docker-compose
) else (
    set DOCKER_COMPOSE=docker compose
)

:: Show usage when no arguments are provided
if "%1"=="" (
    echo Usage: %~n0 [install ^| start ^| startAndBuild ^| stop]
    exit /b 1
)

if "%1"=="install" (
    %DOCKER_COMPOSE% -f docker-compose.dev.yaml up -d
    exit /b
)

if "%1"=="start" (
    %DOCKER_COMPOSE% -f docker-compose.dev.yaml start
    exit /b
)

if "%1"=="startAndBuild" (
    %DOCKER_COMPOSE% -f docker-compose.dev.yaml up -d --build
    exit /b
)

if "%1"=="stop" (
    %DOCKER_COMPOSE% -f docker-compose.dev.yaml stop
    exit /b
)

echo Unknown command: %1
exit /b 1
