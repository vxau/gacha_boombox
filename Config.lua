Config = Config or {}
Config.framework = 'qbcore' --(qbcore/esx/custom)
Config.useItem = false
Config.fixSpeakersCommand = "fixSpeakers" --If speakers dont load use this command to reload all the speakers
Config.itemName = 'speaker' --You need to had this item created in your config or database
Config.timeZone = "Europe/Madrid" --IMPORTANT to set what time zone is your server in
Config.KeyAccessUi = 38
Config.KeyDeleteSpeaker = 194
Config.KeyToMove = 311
Config.KeyToPlaceSpeaker = 191
Config.KeyToChangeAnim = 311

Config.AllowedJobs = {
    { job = 'taxi', minGrade = 4 },  
    { job = 'cardealer',    minGrade = 4 }, 
    { job = 'mechanic', minGrade = 3 },  
    { job = 'mechanic2',    minGrade = 4 }, 
    { job = 'mechanic3', minGrade = 4 },  
    { job = 'mechanic4',    minGrade = 5 }, 
    { job = 'mechanic5', minGrade = 5 },  
    { job = 'bakery',    minGrade = 4 }, 
    { job = 'unicorn', minGrade = 4 },  
    { job = 'bahama',    minGrade = 4 }, 
    { job = 'burgershot', minGrade = 4 },  
    { job = 'uwu',    minGrade = 4 }, 
    { job = 'bahama',    minGrade = 3 }, 
    { job = 'tropical_heights', minGrade = 4 },  
    { job = 'bakery',    minGrade = 4 }, 
    { job = 'unicorn', minGrade = 4 },  
    { job = 'bahama',    minGrade = 4 }, 
    { job = 'ramen', minGrade = 3 },  
    { job = 'vintage_cafe',    minGrade = 4 }, 
    { job = 'mystic_spell',    minGrade = 3 }, 
    { job = 'bath', minGrade = 4 },  
    { job = 'cardealer',    minGrade = 2 }, 
    { job = 'cake_shop', minGrade = 4 },  
    { job = 'icecream',    minGrade = 4 }, 
    { job = 'noir', minGrade = 4 },  
    { job = 'pearl',    minGrade = 4 }, 
    { job = 'luxxx_club', minGrade = 3 },  
    { job = 'fusion',    minGrade = 4 }, 
    { job = 'cigar_s',    minGrade = 3 }, 
    { job = 'cigar_n', minGrade = 3 },  
    { job = 'bayview_lodge', minGrade = 4 },
    { job = 'dragons_beard', minGrade = 4 },
}

Config.Translations = {
    notEnoughDistance= '近くのスピーカーともう少し距離を置いてください。',
    helpNotify= 'スピーカーにアクセスするには ~INPUT_CONTEXT~ を押し、削除するには ~INPUT_FRONTEND_RRIGHT~ を押し、ラジカセを持つには ~INPUT_REPLAY_SHOWHOTKEY~ を押してください。',
    libraryLabel= 'あなたのライブラリ',
    newPlaylistLabel= '新しいプレイリストを作成',
    importPlaylistLabel= '既存のプレイリストをインポート',
    newPlaylist= '新しいプレイリスト',
    playlistName= 'プレイリスト名',
    addSong= '曲を追加',
    deletePlaylist= 'プレイリストを削除',
    unkown= '不明',
    titleFirstMessage= 'まだプレイリストがありませんか？',
    secondFirstMessage= 'プレイリストを作成',
    holdingBoombox= 'スピーカーを設置するには ~INPUT_FRONTEND_RDOWN~ を押し、アニメーションを変更するには ~INPUT_REPLAY_SHOWHOTKEY~ を押してください。',
    noPermission= 'BoomBOXを使用する権限がありません。'
}
