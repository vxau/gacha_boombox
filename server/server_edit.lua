if Config.framework == 'qbcore' then
    QBCore = exports['qb-core']:GetCoreObject()
elseif Config.framework == 'custom' then
	--Import your framework
end

local function GetPlayerJobInfo(src)
    if Config.framework == 'qbcore' then
        local Player = QBCore.Functions.GetPlayer(src)
        if not Player then
            return nil, 0
        end
        local job = Player.PlayerData.job or {}
        local grade = job.grade
        if type(grade) == 'table' then
            grade = grade.level or grade.grade or 0
        end
        return job.name, tonumber(grade) or 0
    elseif Config.framework == 'esx' then
        if ESX then
            local xPlayer = ESX.GetPlayerFromId(src)
            if not xPlayer then
                return nil, 0
            end
            local job = xPlayer.getJob() or {}
            return job.name, tonumber(job.grade) or 0
        else
            print('You need to import ESX in fxmanifest')
        end
    elseif Config.framework == 'custom' then
        --Import your job info function
    end
    return nil, 0
end

function CanUseBoombox(src)
    if not Config.AllowedJobs or next(Config.AllowedJobs) == nil then
        return true
    end
    local jobName, grade = GetPlayerJobInfo(src)
    if not jobName then
        return false
    end
    local rule = Config.AllowedJobs[jobName]
    if not rule then
        return false
    end
    local minGrade = tonumber(rule.minGrade) or 0
    return grade >= minGrade
end

function DeleteItem(src)
    if Config.framework == 'qbcore' then
        local Player = QBCore.Functions.GetPlayer(src)
        Player.Functions.RemoveItem(Config.itemName, 1)
    elseif Config.framework == 'esx' then
        if ESX then
            local xPlayer = ESX.GetPlayerFromId(src)
            xPlayer.removeInventoryItem(Config.itemName, 1)
        else
            print('You need to import ESX in fxmanifest')
        end
    elseif Config.framework == 'custom' then
        --Import your remove item function
    end
end

function AddItem(src)
    if Config.framework == 'qbcore' then
        local Player = QBCore.Functions.GetPlayer(src)
        Player.Functions.AddItem(Config.itemName, 1)
    elseif Config.framework == 'esx' then
        if ESX then
            local xPlayer = ESX.GetPlayerFromId(src)
            xPlayer.addInventoryItem(Config.itemName, 1)
        else
            print('You need to import ESX in fxmanifest')
        end
    elseif Config.framework == 'custom' then
        --Import your additem function
    end
end

if Config.useItem then
    if Config.framework == 'qbcore' then
        QBCore.Functions.CreateUseableItem(Config.itemName, function(source)
            local src = source
            if CanUseBoombox(src) then
                CreateSpeaker(src)
            else
                TriggerClientEvent('gacha_boombox:client:notify', src, Config.Translations.notAllowed)
            end
        end)
    elseif Config.framework == 'esx' then
        if ESX then
            ESX.RegisterUsableItem(Config.itemName, function(playerId)
                local src = playerId
                if CanUseBoombox(src) then
                    CreateSpeaker(src)
                else
                    TriggerClientEvent('gacha_boombox:client:notify', src, Config.Translations.notAllowed)
                end
            end)
        else
            print('You need to import ESX  in fxmanifest')
        end
    elseif Config.framework == 'custom' then
        --Import your usableItem function
    end
else
    RegisterCommand('createSpeaker', function(source)
        local src = source
        if CanUseBoombox(src) then
            CreateSpeaker(src)
        else
            TriggerClientEvent('gacha_boombox:client:notify', src, Config.Translations.notAllowed)
        end
    end)
end
