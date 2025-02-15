import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:movie_pojo/core/cubit/search_cubit/cubit.dart';
import 'package:movie_pojo/core/cubit/search_cubit/states.dart';
import 'package:movie_pojo/core/repository/get_movie_repo.dart';
import 'package:movie_pojo/ui/widgets/category_list_widget.dart';
import 'package:movie_pojo/ui/widgets/dialog_utils.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
            child: BlocProvider(
              create: (context) => SearchCubit(GetMovieRepo()),
              child: BlocConsumer<SearchCubit, SearchStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  var cubit = context.read<SearchCubit>();
                  return Column(
                    children: [
                      TextField(
                        controller: controller,
                        autocorrect: true,
                        onChanged: (value) {
                          if (value.trim().isEmpty) {
                            cubit.maybePerformSearch('');
                          }
                        },
                        onSubmitted: (value) {
                          FocusManager.instance.primaryFocus?.unfocus();
                          if (value.trim().isNotEmpty) {
                            cubit.maybePerformSearch(value);
                          } else {
                            // If submitted value is empty, emit the empty state.
                            cubit.maybePerformSearch('');
                          }
                          //cubit.maybePerformSearch(value);
                        },
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Theme.of(context).hintColor,
                            ),
                        decoration: InputDecoration(
                          prefixIcon: GestureDetector(
                            onTap: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              //cubit.query = controller.text;
                              cubit.maybePerformSearch(controller.text);
                            },
                            child: const ImageIcon(
                              AssetImage('assets/icons/search_icon.png'),
                            ),
                          ),
                          suffixIcon: IconButton(
                            iconSize: 24,
                            onPressed: () {
                              controller.clear();
                              cubit.maybePerformSearch('');
                            },
                            icon: Icon(
                              Icons.close,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                          hintText: 'search'.tr(),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      BlocConsumer<SearchCubit, SearchStates>(
                        listener: (context, state) {
                          if (state is SearchLoadingState) {
                            context.loaderOverlay.show();
                          }
                          if (state is SearchErrorState) {
                            context.loaderOverlay.hide();
                            DialogUtils.showMessage('Error', state.error,
                                'Close', () {}, null, null, context);
                          }
                        },
                        builder: (context, state) {
                          if (state is SearchSuccessState) {
                            context.loaderOverlay.hide();
                            if (cubit.searchResponse == null || cubit.searchResponse?.results?.isEmpty == true) {
                              return Flexible(
                                child: Center(
                                  child: Image.asset(
                                    'assets/images/empty.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }
                            return CategoryListWidget(
                              results: cubit.searchResponse?.results,
                              crossAxisCount: 2,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 20,
                              aspectRatio: 0.74,
                              itemCount: cubit.searchResponse?.results?.length ?? 0,
                            );
                          } else if (state is EmptySearchState) {
                            context.loaderOverlay.hide();
                            return Flexible(
                              child: Center(
                                child: Image.asset(
                                  'assets/images/empty.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          } else {
                            return Flexible(
                              child: Center(
                                child: Image.asset(
                                  'assets/images/empty.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}