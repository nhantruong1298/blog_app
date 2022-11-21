import 'package:pet_data/mapper/blog_data_mapper.dart';
import 'package:pet_data/networking/service_manager.dart';
import 'package:pet_domain/model/blog/blog.dart';
import 'package:pet_domain/repository/blog_repository.dart';

class BlogRepositoryImpl extends BlogRepository {
  final ServiceManager _serviceManager;
  final BlogDataMapper _blogDataMapper;
  BlogRepositoryImpl(this._serviceManager, this._blogDataMapper);
  @override
  Future<List<LoadBlogResult>> loadBlogs(List<String> topics) async{
    final response = await _serviceManager.loadBlogs(topics);

    return _blogDataMapper.mapListBlogResponse(response);
  }
}
