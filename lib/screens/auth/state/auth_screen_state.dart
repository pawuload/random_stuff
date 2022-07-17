import 'package:utopia_hooks/utopia_hooks.dart';

class AuthScreenState {
  final Function onCheckboxPressed;
  final bool isLoading;
  final bool isCheckboxOn;

  const AuthScreenState({
    required this.onCheckboxPressed,
    required this.isLoading,
    required this.isCheckboxOn,
  });
}

AuthScreenState useAuthScreenState({required Function() navigateToIntro}) {
  final isCheckboxOn = useState<bool>(false);
  final isLoading = useState<bool>(false);

  Future<void> onCheckboxPressed() async {
    if (!isCheckboxOn.value) {
      isCheckboxOn.value = !isCheckboxOn.value;
      isLoading.value = !isLoading.value;
      Future.delayed(const Duration(milliseconds: 1500), () {
        isLoading.value = false;
      });
      Future.delayed(const Duration(milliseconds: 2500), () {
        navigateToIntro();
      });
    }
  }

  return AuthScreenState(
    isCheckboxOn: isCheckboxOn.value,
    isLoading: isLoading.value,
    onCheckboxPressed: () => onCheckboxPressed(),
  );
}
