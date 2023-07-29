// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manaber/features/doctor/profile_pationt/video/cubit/video_play_cubit.dart';
import 'package:manaber/features/doctor/profile_pationt/video/widget/video_play_screen.dart';
import 'package:manaber/shared/styles/styles.dart';
import 'widget/item_card_video.dart';
import 'widget/slected_video.dart';
import '../../../../shared/components/navigator.dart';
import '../../../../shared/styles/colors.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  void initState() {
    BlocProvider.of<VideoPlayCubit>(context).getVideosFromApi(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Screen'),
      ),
      body: BlocBuilder<VideoPlayCubit, VideoPlayState>(
        builder: (context, state) {
          if (state is VideoPlayEmpty) {
            return Center(
              child: Text('No Video', style: AppTextStyles.smTitles),
            );
          }
          if (state is VideoPlayLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primarycolor,
              ),
            );
          }
          if (state is VideoPlaySuccessUser) {
            final model = state.listOfModle;
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
              child: ListView.builder(
                itemCount: model.length,
                itemBuilder: (BuildContext context, int index) {
                  return ItemCardVideo(
                    modelVideo: model[index],
                    onDismissed: (p0) {
                      context.read<VideoPlayCubit>().deleteVideoFromApi(
                            id: model[index].patientId,
                            idVideo: model[index].id,
                            url: model[index].url,
                          );
                    },
                    name: model[index].name.isEmpty
                        ? 'Viedo ${index + 1}'
                        : model[index].name,
                    onTap: () {
                      navigateTo(
                          context,
                          VideoPlayScreen(
                            urlVideo: model[index].url,
                            title: model[index].name,
                          ));
                    },
                  );
                },
              ),
            );
          }
          if (state is VideoPlayError) {
            return Center(
              child: Text(
                state.msg,
                style: AppTextStyles.lrTitles.copyWith(color: Colors.black),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primarycolor,
        onPressed: () async {
          final resulte = await navigateTo(
              context,
              BlocProvider(
                create: (context) => VideoPlayCubit(),
                child: SlectedVideo(
                  id: widget.id,
                ),
              ));
          if (resulte == 'refrech') {
            setState(() {
              BlocProvider.of<VideoPlayCubit>(context)
                  .getVideosFromApi(widget.id);
            });
          }
        },
        tooltip: 'Add Video',
        child: const Icon(Icons.add),
      ),
    );
  }
}
