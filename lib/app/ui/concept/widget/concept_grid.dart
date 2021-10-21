import 'package:bpp_riverpod/app/provider/concept_provier.dart';
import 'package:bpp_riverpod/app/ui/concept/widget/concept_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConceptGrid extends ConsumerStatefulWidget {
  const ConceptGrid({Key? key}) : super(key: key);

  @override
  ConsumerState<ConceptGrid> createState() => _ConceptGridState();
}

class _ConceptGridState extends ConsumerState<ConceptGrid> {
  @override
  void initState() {
    if (ref.read(conceptListProvider).concepts.isEmpty) {
      ref.read(conceptListProvider.notifier).getData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final conceptList = ref.watch(conceptListProvider);

    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisExtent: 144,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          if (conceptList.next!.isNotEmpty &&
              index == conceptList.concepts.length - 10) {
            ref.read(conceptListProvider.notifier).getData();
          }
          if (index == conceptList.concepts.length) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                height: 144,
                width: 104.w,
                color: Colors.black,
              ),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return conceptDialog(index);
                    },
                  );
                },
                child: Image.network(
                  conceptList.concepts[index].profile,
                  height: 144,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: InkWell(
                  onTap: () {
                    ref
                        .read(conceptListProvider.notifier)
                        .setConceptLike(index);
                  },
                  child: Icon(
                    conceptList.concepts[index].like
                        ? CupertinoIcons.heart_fill
                        : CupertinoIcons.heart,
                    color: conceptList.concepts[index].like
                        ? const Color(0xffff5757)
                        : const Color(0xffffffff),
                    size: 30,
                  ),
                ),
              ),
              Text(
                '$index',
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 32,
                ),
              )
            ],
          );
        },
        childCount: conceptList.concepts.length +
            (conceptList.next!.isNotEmpty ? 1 : 0),
      ),
    );
  }
}
