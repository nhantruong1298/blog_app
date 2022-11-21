import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'create_blog_state.dart';

class CreateBlogCubit extends Cubit<CreateBlogState> {
  CreateBlogCubit() : super(CreateBlogInitial());
}
