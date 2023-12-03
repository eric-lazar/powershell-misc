<#
.SYNOPSIS
    Test Redis Connection and Get Keys

.DESCRIPTION
    Initializes the connection with the redis server

.Parameter ConnectionString
    The connection string to connect to the redis server. Example: "redisUrl.com:6380,password=PaSSwOrd,ssl=True,abortConnect=False"

.EXAMPLE
    Connect-Redis -ConnectionString "redisUrl.com:6380,password=PaSSwOrd,ssl=True,abortConnect=False"
#>

param (
    [string] $ConnectionString = "127.0.0.1:6379" 
)


Install-Module -Name PsRedis
Import-Module PsRedis

try { Connect-Redis -ConnectionString $ConnectionString }
catch { throw "Unable to connection Redis $($_.Exception.Message)" }

try { Get-RedisInfo } 
catch { Write-Host "Get-RedisInfo failed, but continue on.  Prob need admin mode enabled - $($_.Exception.Message)"}

write-host "`n`nGet-RedisKeys:`n============================"

Get-RedisKeys


Disconnect-Redis