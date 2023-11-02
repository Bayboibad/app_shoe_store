import 'package:app_shoe_store/services/firebase_store_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum UserAdditionState { initial, loading, success, error }

class UserAdditionCubit extends Cubit<UserAdditionState> {
  UserAdditionCubit() : super(UserAdditionState.initial);

  Future<void> addUserToFirestore(String username, String email, String password, String phone) async {
    emit(UserAdditionState.loading);
    
    try {
      // Thực hiện thêm người dùng vào Firestore ở đây
      await FirebaseStoreUser().addUserFisebase(username, email, password, phone);
      emit(UserAdditionState.success);
    } catch (error) {
      emit(UserAdditionState.error);
    }
  }
}
