import 'package:gameshop/model/games_model.dart';
import 'package:gameshop/routes/routes.dart';
import 'package:gameshop/utils/assets.dart';
import 'package:gameshop/utils/strings.dart';

List<GamesModel> gamesList = [
  GamesModel(StaticAssets.freeFireINCODE, Strings.freeFireINCODE, Routes.freeFireIncodeScreen),
  GamesModel(StaticAssets.freeFireINGAME, Strings.freeFireINGAME, Routes.freeFireInGameScreen),
  GamesModel(StaticAssets.freeFireSUBSC, Strings.freeFireSUBSC, Routes.freeFireIncodeScreen),

  GamesModel(StaticAssets.garenaShells, Strings.garenaShells, Routes.garenaShellsScreen),

  GamesModel(StaticAssets.callOfDuty, Strings.callOfDuty, Routes.freeFireInGameScreen),
  GamesModel(StaticAssets.callOfDuty2, Strings.callOfDuty2, Routes.dashBoardScreen),
  GamesModel(StaticAssets.pubgMobileSoon, Strings.pubgMobileSoon, Routes.dashBoardScreen),
  GamesModel(StaticAssets.pubgMobile, Strings.pubgMobile, Routes.freeFireIncodeScreen),
];
