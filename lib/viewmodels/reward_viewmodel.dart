import 'package:flutter/material.dart';
import 'package:loyalty_app/models/reward.dart';
import 'package:loyalty_app/services/reward_service.dart';
import 'package:loyalty_app/utils/format.dart';

class RewardViewModel extends ChangeNotifier {
  final RewardService _rewardService = RewardService();
  List<Reward> _rewards = [];
  int _totalPoints = 0;
  bool _isLoading = false;
  Reward? _currentReward;
  final List<Reward> _favoriteRewards = [];

  List<Reward> get rewards => _rewards;
  String get totalPoints => pointFormat(_totalPoints);
  bool get isLoading => _isLoading;
  Reward? get currentReward => _currentReward;
  List<Reward> get favoriteRewards => _favoriteRewards;

  Future<void> fetchRewards() async {
    _isLoading = true;
    notifyListeners();
    try {
      _rewards = await _rewardService.fetchRewards();
      _calculateTotalPoints();
    } catch (e) {
      _rewards = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void setCurrentReward(Reward reward) async {
    _currentReward = reward;
    notifyListeners();
  }

  void clearCurrentReward() async {
    _currentReward = null;
    notifyListeners();
  }

  void toggleFavorite(Reward reward) async {
    _isLoading = true;
    notifyListeners();
    try {
      // Toggle favorite status for the reward
      if (_favoriteRewards.contains(reward)) {
        // If the reward is already in favorites, remove it
        _favoriteRewards.remove(reward);
      } else {
        // If the reward is not in favorites, add it
        _favoriteRewards.add(reward);
      }
    } catch (e) {
      debugPrint('Error toggling favorite: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void redeemReward(Reward reward) async {
    _isLoading = true;
    notifyListeners();
    try {
      _redeemPoints(reward.rewardPoints);
    } catch (e) {
      debugPrint('Error redeeming reward: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  bool isFavorite(Reward reward) {
    return _favoriteRewards.contains(reward);
  }

  bool isRewardAvailable(Reward reward) {
    return _totalPoints >= reward.rewardPoints;
  }

  void _redeemPoints(int points) {
    if (_totalPoints >= points) {
      _totalPoints -= points;
      notifyListeners();
    } else {
      debugPrint('Not enough points to redeem this reward.');
      notifyListeners();
    }
  }

  void _calculateTotalPoints() {
    _totalPoints = _rewards.fold(0, (sum, reward) => sum + reward.rewardPoints);
    notifyListeners();
  }
}
