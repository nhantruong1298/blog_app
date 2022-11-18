import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pet_data/entity/response/load_blog_response.dart';
import 'package:pet_data/entity/response/load_topic_response.dart';
import 'package:pet_data/entity/response/load_user_topic_response.dart';
import 'package:pet_data/entity/response/sign_in_with_email_response.dart';
import 'package:pet_data/mapper/error_data_mapper.dart';
import 'package:pet_domain/exception/business_exception.dart';
import 'package:pet_domain/exception/business_exception_code.dart';
import 'package:pet_domain/repository/log_service.dart';

class FireBaseService {
  static const String TOPICS_KEY = 'topics';
  static const String USER_TOPIC_KEY = 'user_topics';
  static const String BLOGS_KEY = 'blogs';

  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _fireStore;
  final LogService _logService;
  FireBaseService(this._firebaseAuth, this._fireStore, this._logService);

  Future<SignInWithEmailResponse> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      return SignInWithEmailResponse(
          userName: result.user?.email ?? '', userId: result.user?.uid ?? '');
    } catch (error) {
      throw _mapError(error);
    }
  }

  Future<List<LoadTopicResponse>> loadAllTopic() async {
    try {
      final List<LoadTopicResponse> listTopicResponse = [];
      final response = await _fireStore.collection(TOPICS_KEY).get();

      for (var item in response.docs) {
        listTopicResponse.add(LoadTopicResponse.fromJson(item.data()));
      }
      return listTopicResponse;
    } catch (error) {
      throw _mapError(error);
    }
  }

  Future<List<LoadBlogResponse>> loadBlogs(List<String> topics) async {
    try {
      final List<LoadBlogResponse> listBlogResponse = [];

      await _fireStore.collection(BLOGS_KEY).get().then((snapshot) {
        for (final doc in snapshot.docs) {
          final item = LoadBlogResponse.fromJson(doc.data());

          if (topics.contains(item.topicId ?? '') || topics.isEmpty) {
            listBlogResponse.add(item);
          }
        }
      });

      return listBlogResponse;
    } catch (error) {
      throw _mapError(error);
    }
  }

  Future<LoadUserTopicResponse?> loadUserTopics(String userId) async {
    try {
      final response = await _fireStore
          .collection(USER_TOPIC_KEY)
          .get()
          .then<LoadUserTopicResponse?>((snapshot) {
        final doc =
            snapshot.docs.firstWhereOrNull((element) => element.id == userId);
        if (doc != null) {
          return LoadUserTopicResponse.fromJson(doc.data());
        }

        throw BusinessException(
            businessExceptionCode: BusinessExceptionCode.USER_NOT_FOUND);
      });

      return response;
    } catch (error) {
      throw _mapError(error);
    }
  }

  BusinessException _mapError(Object error) {
    _logService.error(error);
    return ErrorDataMapper.mapFirebaseException(error);
  }
}
