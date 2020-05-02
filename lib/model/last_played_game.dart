import '../image_asset.dart';

class LastPlayedGame{
  final String name;
  final int hoursPlayed;
  final String imagePath;
  final double gameProgress;

  const LastPlayedGame({this.name,this.hoursPlayed,this.imagePath,this.gameProgress});
}

final lastPlayedGames = [
  LastPlayedGame(name: 'Assassins Creed Odyssey', hoursPlayed: 10, gameProgress: 0.30, imagePath: game_assassin),
  LastPlayedGame(name: 'Dead Cells', hoursPlayed: 50, gameProgress:0.85, imagePath: game_dead_cells),
  LastPlayedGame(name: 'Stardew Valley', hoursPlayed: 68, gameProgress: 0.95, imagePath: game_stardew),
  LastPlayedGame(name: 'No Man\'s Sky', hoursPlayed: 12, gameProgress: 0.15, imagePath: game_stardew),
];

final popularWithFriends = [
  game_fortnite, game_pubg,game_apex_legends,
];