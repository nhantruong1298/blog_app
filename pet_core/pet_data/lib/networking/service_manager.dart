import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pet_data/data_source/data_storage.dart';
import 'package:pet_data/entity/response/load_blog_response.dart';
import 'package:pet_data/entity/response/load_topic_response.dart';
import 'package:pet_data/entity/response/load_user_topic_response.dart';
import 'package:pet_data/entity/response/sign_in_with_email_response.dart';
import 'package:pet_data/networking/firebase_service/firebase_service.dart';
import 'package:pet_domain/repository/log_service.dart';

class ServiceManager {
  late final FireBaseService _fireBaseService;
  late final DataStorage _dataStorage;
  late final LogService _logService;

  static ServiceManager? _instance;
  ServiceManager._internal();

  factory ServiceManager(DataStorage dataStorage, LogService logService) {
    if (_instance != null) {
      return _instance!;
    }

    _instance = ServiceManager._internal();
    _instance!._dataStorage = dataStorage;
    _instance!._logService = logService;
    _instance!._fireBaseService = FireBaseService(
      FirebaseAuth.instance,
      FirebaseFirestore.instance,
      _instance!._logService,
    );

    return _instance!;
  }

  Future<SignInWithEmailResponse> signInWithEmailAndPassword(
      String email, String password) async {
    final response =
        await _fireBaseService.signInWithEmailAndPassword(email, password);

    return response;
  }

  Future<List<LoadTopicResponse>> loadAllTopic() async {
    return _fireBaseService.loadAllTopic();
  }

  Future<List<LoadBlogResponse>> loadBlogs(List<String> topics) async {
    return _fireBaseService.loadBlogs(topics);
  }

  Future<LoadUserTopicResponse?> loadUserTopics(String userId) async{
    return _fireBaseService.loadUserTopics(userId);
  }
}
