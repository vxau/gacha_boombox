if Config.framework == 'qbcore' then
    QBCore = exports['qb-core']:GetCoreObject()
elseif Config.framework == 'custom' then
	--Import your framework
end

local function HasSpeakerAccess(src)
    if Config.framework == 'qbcore' then
        local Player = QBCore.Functions.GetPlayer(src)
        if not Player then
            return false
        end

        local jobName = Player.PlayerData.job.name
        local jobGrade = Player.PlayerData.job.grade.level
        return Config.JobAccess
            and Config.JobAccess[jobName]
            and jobGrade >= Config.JobAccess[jobName]
    elseif Config.framework == 'esx' then
        if not ESX then
            print('You need to import ESX in fxmanifest')
            return false
        end

        local xPlayer = ESX.GetPlayerFromId(src)
        if not xPlayer then
            return false
        end

        local jobName = xPlayer.job.name
        local jobGrade = xPlayer.job.grade
        return Config.JobAccess
            and Config.JobAccess[jobName]
            and jobGrade >= Config.JobAccess[jobName]
    elseif Config.framework == 'custom' then
        --Import your access function
        return true
    end

    return false
end

function CanUseBoombox(src)
    return HasSpeakerAccess(src)
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
            if HasSpeakerAccess(src) then
                CreateSpeaker(src)
            else
                TriggerClientEvent('gacha_boombox:client:notify', src, Config.Translations.noAccess)
            end
        end)
    elseif Config.framework == 'esx' then
        if ESX then
            ESX.RegisterUsableItem(Config.itemName, function(playerId)
                local src = playerId
                if HasSpeakerAccess(src) then
                    CreateSpeaker(src)
                else
                    TriggerClientEvent('gacha_boombox:client:notify', src, Config.Translations.noAccess)
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
        if HasSpeakerAccess(src) then
            CreateSpeaker(src)
        else
            TriggerClientEvent('gacha_boombox:client:notify', src, Config.Translations.noAccess)
        end
    end)
end
