// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'controle.dart';
import 'widget/item_card_video.dart';
import 'widget/slected_video.dart';
import '../../../../shared/components/navigator.dart';
import '../../../../shared/styles/colors.dart';
import 'package:open_file/open_file.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final ControleViedoes controleViedoes = ControleViedoes();
  bool isDelete = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Screen'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isDelete = !isDelete;
                });
              },
              icon: const Icon(
                Icons.delete,
                color: AppColors.primarycolor,
              ))
        ],
      ),
      body: controleViedoes.listOfViedoes.isEmpty
          ? const Center(
              child: Text('No Video'),
            )
          : Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 20,
                ),
                itemCount: controleViedoes.listOfViedoes.length,
                itemBuilder: (BuildContext context, int index) {
                  return ItemCardVideo(
                    name: controleViedoes.listOfViedoes[index].tilte.isEmpty
                        ? 'Viedo ${index + 1}'
                        : controleViedoes.listOfViedoes[index].tilte,
                    onPressed: () {
                      setState(() {
                        controleViedoes.listOfViedoes.removeAt(index);
                      });
                    },
                    onTap: () {
                      OpenFile.open(
                          controleViedoes.listOfViedoes[index].videoFiles);
                    },
                    isDelete: isDelete,
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primarycolor,
        onPressed: () async {
          final resulte = await navigateTo(
              context, SlectedVideo(controleViedoes: controleViedoes));
          if (resulte == 'refresh') {
            setState(() {});
          }
        },
        tooltip: 'Add Video',
        child: const Icon(Icons.add),
      ),
    );
  }
}
